require 'test_helper'

class ContentControllerTest < ActionController::TestCase
  test "should get auto" do
    get :auto
    assert_response :success
  end

  test "should get moto" do
    get :moto
    assert_response :success
  end

end
