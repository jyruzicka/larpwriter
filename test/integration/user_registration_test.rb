require "test_helper"

class UserRegistrationTest < ActionDispatch::IntegrationTest

  test "it works when using correct credentials" do
    visit "/"
    click_link "Sign up"

    fill_in "user_email", with: "alice@example.com"
    fill_in "user_password", with: "secret"
    fill_in "user_password_confirmation", with: "secret"
    click_button "Sign up"

    assert page.has_content? "You have signed up successfully"
  end

  test "it fails when using incorrect credentials" do
    visit "/"
    click_link "Sign up"

    fill_in "user_email", with: "joe"
    fill_in "user_password", with: "secret"
    fill_in "user_password_confirmation", with: "secret"
    click_button "Sign up"

    assert page.has_content? "Email is invalid"
  end
end
