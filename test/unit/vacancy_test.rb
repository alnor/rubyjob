require 'test_helper'

class VacancyTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
  test "should not save the vacancy whithout name" do
    vacancy = Vacancy.new
    assert !vacancy.save, "Saved the vacancy whithout name"
  end
  
  test "should not save the vacancy whithout skills" do
    vacancy = Vacancy.new
    assert !vacancy.save, "Saved the vacancy whithout skills"
  end
  
end
