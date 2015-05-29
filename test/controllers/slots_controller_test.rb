require 'test_helper'

class SlotsControllerTest < ActionController::TestCase
  setup do
    @slot = slots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:slots)
  end

  test "should create slot" do
    assert_difference('Slot.count') do
      post :create, slot: { day: @slot.day, hour: @slot.hour, price: @slot.price }
    end

    assert_response 201
  end

  test "should show slot" do
    get :show, id: @slot
    assert_response :success
  end

  test "should update slot" do
    put :update, id: @slot, slot: { day: @slot.day, hour: @slot.hour, price: @slot.price }
    assert_response 204
  end

  test "should destroy slot" do
    assert_difference('Slot.count', -1) do
      delete :destroy, id: @slot
    end

    assert_response 204
  end
end
