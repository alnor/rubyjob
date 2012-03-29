require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "skill should be unique" do
    skill = Skill.new
    assert !skill.save, "skill should be unique"
  end

end
