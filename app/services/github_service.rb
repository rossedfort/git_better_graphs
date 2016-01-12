class GithubService
  attr_reader :client

  def initialize
    @client = Octokit::Client.new(:access_token => ENV["github_token"])
  end

  def repos
    parse(client.get("/users/rossedfort/repos"))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
