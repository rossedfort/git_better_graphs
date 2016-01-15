class GithubService
  attr_reader :client

  def initialize
    @client = Octokit::Client.new(:access_token => ENV["github_token"])
  end

  def repo_data(user)
    client.get("users/#{user}/repos").map { |repo| {label: repo.name, value: repo.size} }
  end

  def follower_repos(user)
    client.get("users/#{user}/repos")
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
    client.get("/repos/#{user_name}/#{repo_name}/stats/commit_activity").map(&:total).reduce(:+)
  end

  def contributor_data(user_name, repo_name)
    client.get("/repos/#{user_name}/#{repo_name}/stats/contributors").map { |contribution| {label: contribution.author.login, value: contribution.total} }
  end

  def search(user)
    client.get("/search/users?q=#{user}")
  end
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
