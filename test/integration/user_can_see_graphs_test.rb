require 'test_helper'

class UserCanSeeGraphsTest < ActionDispatch::IntegrationTest
  Capybara.javascript_driver = :selenium
  test "user can see profile page graph" do
    stub_omniauth
    stub_current_user
    VCR.use_cassette("users_controller_show") do
      visit "/"
      click_on "myGraphs"
      assert_equal user_path(User.first.nickname), current_path
    end
  end
end
