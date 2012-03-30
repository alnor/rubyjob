require 'test_helper'

class SkillsControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  
  test "should delete skill" do
    assert_difference('Skill.count', -1) do
      delete :destroy, :id=>Skill.first
    end
  end 
  
end
