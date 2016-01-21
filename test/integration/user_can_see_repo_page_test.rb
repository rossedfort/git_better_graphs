require 'test_helper'

class UserCanSeeRepoPageTest < ActionDispatch::IntegrationTest
  test "user can view repo graphs page" do
    stub_omniauth
    stub_current_user
    VCR.use_cassette("repos_controller_show") do
      visit user_repo_path(user_id: 'rossedfort', id: 'git_better_graphs')
      assert page.has_content?("watchers:")
      assert page.has_content?("open issues:")
      assert page.has_content?("commits:")
      assert page.has_content?("contributors:")
      assert page.has_content?("forks:")
      assert page.has_content?("size in lines:")
      assert page.has_content?("name:")
      assert page.has_content?("description:")
      assert page.has_content?("primary language:")
      assert page.has_content?("contributor")
      assert page.has_content?("language")
      assert page.has_content?("commit")
      assert page.has_content?("frequency")
      assert page.has_content?("pulls")
    end
  end
end
