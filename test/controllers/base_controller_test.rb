require 'test_helper'

class BaseControllerTest < ActionController::TestCase
  test "should get countries" do
    get :countries
    assert_response :success
  end

end
