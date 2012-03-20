class VacanciesController < ApplicationController
  
  before_filter :create_vacancy,  :only => [:new,:create]
  before_filter :find_vacancy,    :only => [:show,:edit,:update,:destroy]
  
  def index
    @vacancy=Vacancy.all
    respond_to do |format|
      format.html
      format.xml  { render :xml     => @vacancy}
    end    
  end
  
  def new
  end  
  
  def edit
    respond_to do |format|
      format.html
      format.xml  { render :xml => @vacancy}
    end    
  end
  
  def create
    @vacancy.attributes=params[:vacancy]
    respond_to do |format|
      if @vacancy.save
        flash[:notice] = l(:notice_successful_create)
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
      if  @vacancy.update_attributes(params[:vacancy])
        flash[:notice] = l(:notice_successful_update)
        format.html { redirect_to :controller => 'vacancies', :action => "edit",:id => @vacancy }
        format.xml  { head :ok }
      else
        format.html { render  :controller=>'vacancies', :action=>"edit", :id => @vacancy}
        format.xml  { render :xml => @vacancy.errors }
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
