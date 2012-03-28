class WorkersController < ApplicationController
  
  before_filter :create_worker,  :only => [:new,:create]
  before_filter :find_worker,    :only => [:show,:edit,:update,:destroy]
    
  def index
    @worker = Worker.all
    respond_to do |format|
      format.html
      format.xml  { render :xml     => @worker}
    end     
  end
  
  def new
    @skill=Skill.all
  end
  
  def edit
    respond_to do |format|
      format.html
      format.xml  { render :xml => @worker}
    end    
  end  
  
  def create  
    @worker.attributes=params[:worker]
    respond_to do |format|
      if @worker.save
        flash[:notice] = t(:notice_successful_create)
        format.html { redirect_to :action => "edit", :id => @worker}
        format.xml  { render      :xml    => @worker, :status => :created, :location => @worker }
      else
        format.html { render  :action=>'new'}
        format.xml  { render  :xml    => @worker.errors}
      end
    end    
  end
  
  def update
    respond_to do |format|
      if  @worker.update_attributes(params[:worker])
        flash[:notice] = t(:notice_successful_update)
        format.html { redirect_to :controller => 'worker', :action => "edit",:id => @vacancy }
        format.xml  { head :ok }
      else
        format.html { render  :controller=>'worker', :action=>"edit", :id => @worker}
        format.xml  { render :xml => @worker.errors }
      end
    end
  end   
  
  private
  
  def create_worker
    @worker = Worker.new
  end
  
  def find_worker
    @worker = Worker.find(params[:id])
  end  

end
