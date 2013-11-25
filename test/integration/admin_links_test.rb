require "test_helper"

class AdminLinksTest < ActionDispatch::IntegrationTest

  test "Site admin can see the admin links dropdown" do
    login_as users(:site_admin), scope: :user

    visit "/"

    assert page.has_content? "Admin links"
  end

  test "Non site admin can not see the admin links dropdown" do
    login_as joe, scope: :user

    visit "/"

    assert page.has_no_content? "Admin links"
  end
end
