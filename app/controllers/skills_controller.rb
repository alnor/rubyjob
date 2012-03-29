class SkillsController < ApplicationController
  
  before_filter :del_skill,    :only => [:destroy]
  
  def index
  end

  def destroy
    flash[:notice] = t(:notice_successful_delete) if @skill.destroy
    respond_to do |format|
      format.html { redirect_to :controller=>'vacancies',:action => "index"}
      format.xml  { render :xml=>"ok"}
    end
  end  
  
  private
  
  def del_skill
    @skill = Skill.find(params[:id])
  end
  
end
