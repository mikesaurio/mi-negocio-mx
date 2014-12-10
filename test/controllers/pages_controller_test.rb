require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get quiere" do
    get :quiere
    assert_response :success
  end

  test "should get encuesta" do
    get :encuesta
    assert_response :success
  end

  test "should get paso" do
    get :paso
    assert_response :success
  end

end
