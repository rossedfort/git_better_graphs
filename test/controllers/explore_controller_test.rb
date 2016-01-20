require 'test_helper'

class ExploreControllerTest < ActionController::TestCase
  test "#index" do
    stub_current_user
    VCR.use_cassette("explore_controller") do
      get :index, id: 'rossedfort'

      assert_response :success
    end
  end

  test "#search" do
    VCR.use_cassette("explore_controller#search") do
      get :search, id: 'rossedfort'

      assert_response :success
    end
  end
end
