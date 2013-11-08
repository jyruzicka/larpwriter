require "test_helper"

class HomepageTest < ActionDispatch::IntegrationTest

  test "it contains 'Welcome!'" do
    visit "/"

    assert page.has_content? "Welcome!"
  end
end
