require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  setup do
    @album = albums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:albums)
  end

  test "should create album" do
    assert_difference('Album.count') do
      post :create, album: { image_10: @album.image_10, image_1: @album.image_1, image_2: @album.image_2, image_3: @album.image_3, image_4: @album.image_4, image_5: @album.image_5, image_6: @album.image_6, image_7: @album.image_7, image_8: @album.image_8, image_9: @album.image_9 }
    end

    assert_response 201
  end

  test "should show album" do
    get :show, id: @album
    assert_response :success
  end

  test "should update album" do
    put :update, id: @album, album: { image_10: @album.image_10, image_1: @album.image_1, image_2: @album.image_2, image_3: @album.image_3, image_4: @album.image_4, image_5: @album.image_5, image_6: @album.image_6, image_7: @album.image_7, image_8: @album.image_8, image_9: @album.image_9 }
    assert_response 204
  end

  test "should destroy album" do
    assert_difference('Album.count', -1) do
      delete :destroy, id: @album
    end

    assert_response 204
  end
end
