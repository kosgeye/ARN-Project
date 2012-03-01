require 'test_helper'

class FreezersControllerTest < ActionController::TestCase
  setup do
    @freezer = freezers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:freezers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create freezer" do
    assert_difference('Freezer.count') do
      post :create, freezer: @freezer.attributes
    end

    assert_redirected_to freezer_path(assigns(:freezer))
  end

  test "should show freezer" do
    get :show, id: @freezer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @freezer.to_param
    assert_response :success
  end

  test "should update freezer" do
    put :update, id: @freezer.to_param, freezer: @freezer.attributes
    assert_redirected_to freezer_path(assigns(:freezer))
  end

  test "should destroy freezer" do
    assert_difference('Freezer.count', -1) do
      delete :destroy, id: @freezer.to_param
    end

    assert_redirected_to freezers_path
  end
end
