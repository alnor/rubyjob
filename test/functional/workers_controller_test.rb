require 'test_helper'

class WorkersControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:worker)
  end
  
  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:worker)
  end   
  
  test "should create vacancy" do
    assert_difference('Worker.count') do
      post :create, :worker => { :name => 'Some name', :contacts=>'1234567890'}
    end
   
    assert_redirected_to :controller=>'workers', :action=>'edit', :id=>assigns(:worker)
  end    
  
  test "should get edit" do
    get :edit, {'id' => Worker.first}
    assert_response :success
    assert_not_nil assigns(:worker)
  end   
  
  test "should delete worker" do
    assert_difference('Worker.count', -1) do
      delete :destroy, :id=>Worker.first
    end
  end   
  
end
