require "test_helper"

class LarpsControllerTest < ActionController::TestCase
  test "new is not accessible for anonymous user" do
    get :new
    assert_equal "You need to sign in or sign up before continuing.", flash[:alert]
  end

  test "show is accessible for larp organizer" do
    sign_in joe
    get :show, id: joe_larp.id
    assert_response :success
  end

  test "show is not accessible for non organizer" do
    sign_in jack
    get :show, id: joe_larp.id
    assert_equal "You are not authorized to access this page", flash[:alert]
  end
end
