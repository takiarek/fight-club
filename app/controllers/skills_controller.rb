class SkillsController < ApplicationController
  def create
    @fighter = Fighter.find(params[:fighter_id])
    @skill = @fighter.skills.build(skills_params)
    @skill.save
    redirect_to fighter_path(@fighter)
  end

  private
    def skills_params
      params.require(:skill).permit(:name, :level)
    end
end
