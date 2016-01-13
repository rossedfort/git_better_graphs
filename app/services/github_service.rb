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

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end

#client.get("users/#{user.nickname}/repos").map { |repo| { "#{repo[:name]}" => repo[:size]} }
