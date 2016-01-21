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

  test "#specific_repo_data" do
    VCR.use_cassette("repos_controller#index") do
      get :specific_repo_data, user_id: 'rossedfort', id: 'git_better_graphs'

      assert_response :success
      assert parsed_response.flatten.include?("rossedfort")
      assert parsed_response.flatten.include?("git_better_graphs")
    end
  end

  test "#commit_data" do
    VCR.use_cassette("repos_controller#commit_data") do
      get :commit_data, user_id: 'rossedfort', id: 'git_better_graphs'

      assert_response :success
    end
  end

  test "#commit_activity" do
    VCR.use_cassette("repos_controller#commit_activity") do
      get :commit_activity, user_id: 'rossedfort', id: 'git_better_graphs'

      assert_response :success
    end
  end

  test "#language_data" do
    VCR.use_cassette("repos_controller#language_data") do
      get :language_data, user_id: 'rossedfort', id: 'git_better_graphs'

      assert_response :success
    end
  end

  test "#contributor_data" do
    VCR.use_cassette("repos_controller#contributor_data") do
      get :contributor_data, user_id: 'rossedfort', id: 'git_better_graphs'

      assert_response :success
    end
  end

  test "#code_frequency" do
    VCR.use_cassette("repos_controller#code_frequency") do
      get :code_frequency, user_id: 'rossedfort', id: 'git_better_graphs'

      assert_response :success
    end
  end
end
