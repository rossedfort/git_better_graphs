class GithubService
  attr_reader :client, :user

  def initialize(user)
    @user = user
    @client = Octokit::Client.new(:access_token => ENV["github_token"])
  end

  def repos
    client.get("/users/#{user.nickname}/repos")
  end

  def followers
    client.get("/users/#{user.nickname}/followers")
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
