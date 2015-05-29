require 'test_helper'

class FacilitiesControllerTest < ActionController::TestCase
  setup do
    @facility = facilities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:facilities)
  end

  test "should create facility" do
    assert_difference('Facility.count') do
      post :create, facility: { name: @facility.name }
    end

    assert_response 201
  end

  test "should show facility" do
    get :show, id: @facility
    assert_response :success
  end

  test "should update facility" do
    put :update, id: @facility, facility: { name: @facility.name }
    assert_response 204
  end

  test "should destroy facility" do
    assert_difference('Facility.count', -1) do
      delete :destroy, id: @facility
    end

    assert_response 204
  end
end
