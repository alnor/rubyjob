require 'test_helper'

class VacancyTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
  test "should not save the vacancy whithout name" do
    vacancy = Vacancy.new
    assert !vacancy.save, "Saved the vacancy whithout name"
  end
  
  test "should not save the vacancy if contacts not exists email or phone" do
    vacancy = Vacancy.new
    assert !vacancy.save, "Saved the vacancy if contacts not exists email or phone"
  end
  
end
