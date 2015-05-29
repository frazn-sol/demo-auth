require 'test_helper'

class FieldsControllerTest < ActionController::TestCase
  setup do
    @field = fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fields)
  end

  test "should create field" do
    assert_difference('Field.count') do
      post :create, field: { name: @field.name }
    end

    assert_response 201
  end

  test "should show field" do
    get :show, id: @field
    assert_response :success
  end

  test "should update field" do
    put :update, id: @field, field: { name: @field.name }
    assert_response 204
  end

  test "should destroy field" do
    assert_difference('Field.count', -1) do
      delete :destroy, id: @field
    end

    assert_response 204
  end
end
