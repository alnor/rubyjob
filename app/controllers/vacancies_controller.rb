class VacanciesController < ApplicationController
  
  before_filter :create_vacancy,  :only => [:new,:create]
  before_filter :find_vacancy,    :only => [:show,:edit,:update,:destroy,:add_skill]
  
  def index
    @vacancy=Vacancy.all
    respond_to do |format|
      format.html
      format.xml  { render :xml     => @vacancy}
    end    
  end
  
  def new
    #@skill=Skill.all
  end  
  
  def edit
    respond_to do |format|
      format.html
      format.xml  { render :xml => @vacancy}
    end    
  end
  
  def create
    @vacancy.lifetime = date_convert_from_post(params[:vacancy], :lifetime)
    @vacancy.name=params[:vacancy][:name]
    @vacancy.salary=params[:vacancy][:salary]
    @vacancy.contacts=params[:vacancy][:contacts]

    respond_to do |format|
      if @vacancy.save
        flash[:notice] = t(:notice_successful_create)
        format.html { redirect_to :action => "edit", :id => @vacancy}
        format.xml  { render      :xml    => @vacancy, :status => :created, :location => @vacancy }
      else
        format.html { render  :action=>'new'}
        format.xml  { render  :xml    => @vacancy.errors}
      end
    end    
  end
  
  def update
    respond_to do |format|
      if  @vacancy.update_attributes(:lifetime=>date_convert_from_post(params[:vacancy], :lifetime), :name => params[:vacancy][:name], :salary => params[:vacancy][:salary], :contacts=>params[:vacancy][:contacts])
        flash[:notice] = t(:notice_successful_update)
        format.html { redirect_to :controller => 'vacancies', :action => "edit",:id => @vacancy }
        format.xml  { head :ok }
      else
        format.html { render  :controller=>'vacancies', :action=>"edit", :id => @vacancy}
        format.xml  { render :xml => @vacancy.errors }
      end
    end
  end  
  
  def destroy
    flash[:notice] = t(:notice_successful_delete) if @vacancy.destroy
    respond_to do |format|
      format.html { redirect_to :controller=>'vacancies',:action => "index"}
      format.xml  { render :xml=>"ok"}
    end
  end    
  
  def add_skill
    
    @skill = Skill.new
    @skill.name=params[:skill]
    
    if @vacancy.skills << @skill
      respond_to do |format|
          format.js {}
      end    
    end
   
  end
  
  private
  
  def create_vacancy
    @vacancy = Vacancy.new
  end
  
  def find_vacancy
    @vacancy = Vacancy.find(params[:id])
  end  

end
