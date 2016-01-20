require 'test_helper'

class UserCanLogoutTest < ActionDispatch::IntegrationTest
  test "user can logout" do
    stub_omniauth
    stub_current_user
    visit "/"
    click_on "Logout"
    assert page.has_content?("Goodbye")
  end
end
