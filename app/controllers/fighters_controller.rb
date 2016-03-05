class FightersController < ApplicationController
  def index
    @fighters = Fighter.all
  end

  def show
    @fighter = Fighter.find(params[:id])
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
