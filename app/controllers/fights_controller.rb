class FightsController < ApplicationController
  def show
    @fight = Fight.find(params[:id])
    @winner = Fighter.find(@fight[:winner_id])
    @loser = Fighter.find(@fight[:loser_id])
  end

  def new
    @fighters = Fighter.all
    @fight = Fight.new
  end

  def create
    fighter_1 = Fighter.find(params[:fighter_ids][0])
    fighter_2 = Fighter.find(params[:fighter_ids][1])
    @fight = fight(fighter_1,fighter_2)

    if @fight.save
      redirect_to @fight
    else
      render 'new'
    end
  end

  private
    # def fight_params
    #   params.require(:fighter).permit(:fname, :lname, :description)
    # end

    def fight(fighter_1,fighter_2)
      power_1 = 0
      power_2 = 0
      fighter_1.skills.each do |s|
        power_1 += s.level
      end
      fighter_2.skills.each do |s|
        power_2 += s.level
      end
      if power_1 >= power_2
        Fight.new(winner_id: fighter_1.id, loser_id: fighter_2.id)
      else
        Fight.new(winner_id: fighter_2.id, loser_id: fighter_1.id)
      end
    end
end
