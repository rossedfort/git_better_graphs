require 'test_helper'

class UserCanSeeProfilePageTest < ActionDispatch::IntegrationTest
  test "user can see profile page graph" do
    stub_omniauth
    stub_current_user
    VCR.use_cassette("users_controller_show") do
      visit "/"
      click_on "myGraphs"
      assert_equal user_path(User.first.nickname), current_path
      assert page.has_content?("Username")
      assert page.has_content?("Followers")
      assert page.has_content?("Following")
      assert page.has_content?("Repos")
    end
  end
end
