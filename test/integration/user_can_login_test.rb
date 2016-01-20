require 'test_helper'

class UserCanLoginTest < ActionDispatch::IntegrationTest
  test "user can login" do
    stub_omniauth
    VCR.use_cassette("github_service#login") do
      visit "/"
      click_on "Login"
    end
  end
end
