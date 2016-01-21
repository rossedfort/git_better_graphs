class GithubService
  attr_reader :client

  def initialize
    @client = Octokit::Client.new(:access_token => ENV["github_token"])
  end

  def repo_data(user)
    client.repositories(user, per_page: 100)
  end

  def followers(user)
    client.get("users/#{user}/followers")
  end

  def following(user)
    client.get("users/#{user}/following")
  end

  def data(user)
    client.get("users/#{user}")
  end

  def specific_repo_data(user_name, repo_name)
    client.get("repos/#{user_name}/#{repo_name}")
  end

  def language_data(user_name, repo_name)
    client.get("repos/#{user_name}/#{repo_name}/languages")
  end

  def commit_data(user_name, repo_name)
    client.get("/repos/#{user_name}/#{repo_name}/stats/commit_activity")
  end

  def contributor_data(user_name, repo_name)
    client.contributors_stats("#{user_name}/#{repo_name}")
  end

  def search(user)
    client.search_users(user, per_page: 100)
  end

  def code_frequency(user_name,repo_name)
    client.get("/repos/#{user_name}/#{repo_name}/stats/code_frequency")
  end

  def pull_requests(user_name, repo_name)
    client.pull_requests("#{user_name}/#{repo_name}", options = {:state => 'all', per_page: 100})
  end
end
