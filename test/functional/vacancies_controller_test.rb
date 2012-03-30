require 'test_helper'

class VacanciesControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vacancy)
  end
  
  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:vacancy)
  end  
  
  test "should create vacancy" do
    assert_difference('Vacancy.count') do
      post :create, :vacancy => { :name => 'Some name', :contacts=>'1234567890'}
    end
   
    assert_redirected_to :controller=>'vacancies', :action=>'edit', :id=>assigns(:vacancy)
  end  
  
  test "should get edit" do
    get :edit, {'id' => Vacancy.first}
    assert_response :success
    assert_not_nil assigns(:vacancy)
  end 
  
  test "should delete vacancy" do
    assert_difference('Vacancy.count', -1) do
      delete :destroy, :id=>Vacancy.first
    end
  end   
  
end
