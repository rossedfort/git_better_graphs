require 'test_helper'

class ReposControllerTest < ActionController::TestCase
  test "#index" do
    VCR.use_cassette("repos_controller#index") do
      get :index, user_id: 'rossedfort', id: 'git_better_graphs'

      assert_response :success
    end
  end

  test "#show" do
    VCR.use_cassette("repos_controller#show") do
      get :show, user_id: 'rossedfort', id: 'git_better_graphs'

      assert_response :success
    end
  end
end
