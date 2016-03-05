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
    @fighter_1 = Fighter.find(params[:fighter_ids][0])
    @fighter_2 = Fighter.find(params[:fighter_ids][1])
    @fight = fight(@fighter_1,@fighter_2)

    if @fight.save
      @fighter_1.save
      @fighter_2.save
      redirect_to @fight
    else
      render 'new'
    end
  end

  private
    def fight(fighter_1,fighter_2)
      power_1 = fighter_1.experience
      power_2 = fighter_2.experience
      exp_diff = (fighter_1.experience - fighter_2.experience).abs
      win_exp = 20 + 0.6 * exp_diff
      loss_exp = 10 + 0.4 * exp_diff

      fighter_1.skills.each do |s|
        power_1 += s.level
      end
      fighter_2.skills.each do |s|
        power_2 += s.level
      end

      if power_1 >= power_2
        fighter_1.experience += win_exp
        fighter_2.experience += loss_exp
        Fight.new(winner_id: fighter_1.id, loser_id: fighter_2.id)
      else
        fighter_2.experience += win_exp
        fighter_1.experience += loss_exp
        Fight.new(winner_id: fighter_2.id, loser_id: fighter_1.id)
      end
    end
end
