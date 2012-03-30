
class String
  def levenshtein(other, ins=1, del=1, sub=1)
    return nil if self.nil?
    return nil if other.nil?
    dm = [] 
  
    dm[0] = (0..self.length).collect { |i| i * ins }
    fill = [0] * (self.length - 1)
  
    for i in 1..other.length
      dm[i] = [i * del, fill.flatten]
    end
  
    for i in 1..other.length
      for j in 1..self.length
        dm[i][j] = [
          dm[i-1][j-1] +
          (self[j-1] == other[i-1] ? 0 : sub),
          dm[i][j-1] * ins,
          dm[i-1][j] + del
        ].min
      end
    end
  
    dm[other.length][self.length]
  end  
end

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def date_convert_from_post(hash,index)
    if hash
      return Time.zone.now.strftime("%Y-%m-%d %H:%M") if hash["#{index}(1i)"].nil? || hash["#{index}(2i)"].nil? || hash["#{index}(3i)"].nil?
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
