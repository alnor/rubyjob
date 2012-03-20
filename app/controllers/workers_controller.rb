class WorkersController < ApplicationController
  
  before_filter :create_worker,  :only => [:new,:create]
  before_filter :find_worker,    :only => [:show,:edit,:update,:destroy]
    
  def index
  end
  
  private
  
  def create_worker
    @worker = Worker.new
  end
  
  def find_worker
    @worker = Worker.find(params[:id])
  end  

end
