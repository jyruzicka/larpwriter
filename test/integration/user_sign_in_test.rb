require "test_helper"

class UserSignInTest < ActionDispatch::IntegrationTest

  test "it works when using correct credentials" do
    visit "/"
    click_link "Sign in"

    fill_in "user_email", with: "joe@example.com"
    fill_in "user_password", with: "secret"
    click_button "Sign in"

    assert page.has_content? "Signed in successfully."
  end

  test "it fails when using incorrect credentials" do
    visit "/"
    click_link "Sign in"

    fill_in "user_email", with: "joe@example.com"
    fill_in "user_password", with: "wrong"
    click_button "Sign in"

    assert page.has_content? "Invalid email or password."
  end
end
