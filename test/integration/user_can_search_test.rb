require 'test_helper'

class UserCanSearchTest < ActionDispatch::IntegrationTest
  test "user can search" do
    stub_omniauth
    stub_current_user
    VCR.use_cassette("explore_controller_search_happy") do
      visit explore_path
      within("#searchForm") do
        fill_in "id", with: "rails"
        click_on "Search"
      end
      assert_equal search_path, current_path
    end
  end

  test "user can't search without filling in field" do
    stub_omniauth
    stub_current_user
    VCR.use_cassette("explore_controller_search_sad") do
      visit explore_path
      within("#searchForm") do
        click_on "Search"
      end
      refute_equal search_path, current_path
      assert_equal explore_path, current_path
    end
  end
end
