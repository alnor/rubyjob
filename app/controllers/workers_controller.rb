class WorkersController < ApplicationController
  
  before_filter :create_worker,  :only => [:new,:create]
  before_filter :find_worker,    :only => [:show,:edit,:update,:destroy,:add_skill]
    
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
      params[:worker].delete(:skills)
      if  @worker.update_attributes(params[:worker])
        flash[:notice] = t(:notice_successful_update)
        format.html { redirect_to :controller => 'workers', :action => "edit",:id => @worker }
        format.xml  { head :ok }
      else
        format.html { render  :controller=>'workers', :action=>"edit", :id => @worker}
        format.xml  { render :xml => @worker.errors }
      end
    end
  end   
  
  def destroy
    flash[:notice] = t(:notice_successful_delete) if @worker.destroy
    respond_to do |format|
      format.html { redirect_to :controller=>'worker',:action => "index"}
      format.xml  { render :xml=>"ok"}
    end
  end   
  
  def add_skill
    
    @skill = Skill.new
    @skill.name=params[:skill]
    
    if @worker.skills << @skill
      respond_to do |format|
          format.js {}
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
