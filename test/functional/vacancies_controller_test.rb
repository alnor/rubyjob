require 'test_helper'

class VacanciesControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vacancy)
  end
end
