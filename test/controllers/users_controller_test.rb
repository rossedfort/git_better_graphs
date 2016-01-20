require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "#show" do
    VCR.use_cassette("users_controller#show") do
      get :show, id: 'rossedfort'

      assert_response :success
    end
  end

  test "#repo_data" do
    VCR.use_cassette("users_controller#repo_data") do
      get :repo_data, format: :json, id: 'rossedfort'

      assert_response :success
    end
  end

  test "#follower_data" do
    VCR.use_cassette("users_controller#follower_data") do
      get :follower_data, format: :json, id: 'rossedfort'

      assert_response :success
    end
  end
end
