class GithubService
  attr_reader :client

  def initialize
    @client = Octokit::Client.new(:access_token => ENV["github_token"])
  end

  def repos(user)
    client.get("users/#{user}/repos")
  end

  def follower_repos(user)
    client.get("users/#{user}/repos")
  end

  def followers(user)
    client.get("users/#{user}/followers")
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

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
