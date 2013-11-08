require "test_helper"

class PcsControllerTest < ActionController::TestCase

  test "new is not accessible for anonymous user" do
    get :new, {larp_id: joe_larp.id}
    assert_equal "You need to sign in or sign up before continuing.", flash[:alert]
  end

  test "new is accessible for larp organizer" do
    sign_in joe
    get :new, {larp_id: joe_larp.id}
    assert_response :success
  end

  test "new is not accessible for non organizer" do
    sign_in jack
    get :new, {larp_id: joe_larp.id}
    assert_equal "You are not authorized to access this page", flash[:alert]
  end

end
