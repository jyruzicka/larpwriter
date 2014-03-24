require "test_helper"

class LarpCreationTest < ActionDispatch::IntegrationTest
  test "it works" do
    login_as joe, scope: :user

    visit "/"
    click_link "Create a new larp"
    fill_in "larp_name", with: "Joe's larp"
    click_button "Create"

    assert page.has_content? "Your larp has been created!"
  end

  test "it fails is name is missing" do
    login_as joe, scope: :user

    visit "/"
    click_link "Create a new larp"
    click_button "Create"

    assert page.has_content? "can't be blank"
  end
end
