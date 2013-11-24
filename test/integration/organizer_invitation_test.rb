require "test_helper"

class OrganizerInvitationText < ActionDispatch::IntegrationTest

  test "invited person without account is redirected directly to the larp after account creation, and can access it" do
    login_as joe, scope: :user
    visit new_larp_organizer_url(joe_larp)
    fill_in "organizer_first_name", with: "Mark"
    fill_in "organizer_email", with: "mark@example.com"
    click_button "Create organizer"
    click_link "Sign out"

    visit_link_in email: last_email_sent_to("mark@example.com"),
      link_text: "http://www.example.com/users/sign_up"

    fill_in "user_email", with: "mark@example.com"
    fill_in "user_password", with: "secret"
    fill_in "user_password_confirmation", with: "secret"
    click_button "Sign up"

    assert page.has_content? "You have signed up successfully"
    assert current_path, larp_path(joe_larp)
  end

  test "invited person with pre existing account can access the larp" do
    login_as joe, scope: :user
    visit new_larp_organizer_url(joe_larp)
    fill_in "organizer_first_name", with: "Jack"
    fill_in "organizer_email", with: "jack@example.com"
    click_button "Create organizer"
    click_link "Sign out"

    login_as jack, scope: :user
    visit_link_in email: last_email_sent_to("jack@example.com"),
      link_text: larp_url(joe_larp)
    assert current_path, larp_path(joe_larp)
  end

end
