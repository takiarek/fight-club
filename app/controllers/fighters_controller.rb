class FightersController < ApplicationController
  def index
    @fighters = Fighter.order(wins_count: :desc)
  end

  def show
    @fighter = Fighter.find(params[:id])
    @skill = @fighter.skills.build
  end

  def new
    @fighter = Fighter.new
  end

  def create
    @fighter = Fighter.new(fighter_params)

    if @fighter.save
      redirect_to @fighter
    else
      render 'new'
    end
  end

  private
    def fighter_params
      params.require(:fighter).permit(:fname, :lname, :description, :avatar)
    end
end
