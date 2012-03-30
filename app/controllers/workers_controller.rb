class WorkersController < ApplicationController
  
  before_filter :create_worker,  :only => [:new,:create]
  before_filter :find_worker,    :only => [:show,:edit,:update,:destroy,:add_skill, :find]
    
  def index
    @worker = Worker.all
    respond_to do |format|
      format.html
      format.xml  { render :xml     => @worker}
    end     
  end
  
  def new
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
      #params[:worker].delete(:skill_sell)
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
  
  def find
    @vacancy=@worker.skills.joins(:skills_vacancies=>:vacancy).collect do |v|
      v.vacancies.active
    end
    
    @sub_vacancies=@worker.skills.map do |skill|
      ret=[]
      (Skill.all-@worker.skills).each do |other_skill|
        estimate=skill.name.levenshtein(other_skill.name)
        p estimate, skill.name, other_skill.name
        if estimate<=10 and estimate>1
          other_skill.vacancies.each do |e|
            ret << e
          end
        end
      end 

      ret.flatten.uniq-@vacancy.flatten.uniq
      
    end    
    
    respond_to do |format|
        format.js {}
    end    
  end
    
  
  def add_skill
    
    unless params[:selected_skill].empty?
      @worker.skills << Skill.find(params[:selected_skill])
    end
    
    unless params[:skill].empty?
      @skill = Skill.new({:name=>params[:skill]})
      @worker.skills << @skill
    end     
    
    respond_to do |format|
        format.js {}
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
