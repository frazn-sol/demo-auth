require 'test_helper'

class CoverPhotosControllerTest < ActionController::TestCase
  setup do
    @cover_photo = cover_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cover_photos)
  end

  test "should create cover_photo" do
    assert_difference('CoverPhoto.count') do
      post :create, cover_photo: { photo: @cover_photo.photo }
    end

    assert_response 201
  end

  test "should show cover_photo" do
    get :show, id: @cover_photo
    assert_response :success
  end

  test "should update cover_photo" do
    put :update, id: @cover_photo, cover_photo: { photo: @cover_photo.photo }
    assert_response 204
  end

  test "should destroy cover_photo" do
    assert_difference('CoverPhoto.count', -1) do
      delete :destroy, id: @cover_photo
    end

    assert_response 204
  end
end
