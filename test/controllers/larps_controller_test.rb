require "test_helper"

class LarpsControllerTest < ActionController::TestCase

  test "new is not accessible for anonymous user" do
    get :new
    assert_equal "You need to sign in or sign up before continuing.", flash[:alert]
  end

end
