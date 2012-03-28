class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def date_convert_from_post(hash,index)
    if hash
      hash["#{index}(1i)"]+'-'+ hash["#{index}(2i)"]+'-'+ hash["#{index}(3i)"]
    else
      Time.zone.now.strftime("%Y-%m-%d %H:%M")
    end
  end   
  
  def instantiate_controller_and_action_names
      @current_action = action_name
      @current_controller = controller_name
  end  
end
