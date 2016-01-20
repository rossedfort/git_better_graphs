class Repo
  def self.service
    GithubService.new
  end

  def self.specific_repo_data(user_name, repo_name)
    service.specific_repo_data(user_name, repo_name)
  end

  def self.commit_data(user_name, repo_name)
    service.commit_data(user_name, repo_name)
  end

  def self.commit_activity(user_name, repo_name)
    service.commit_data(user_name, repo_name).map do |commit|
      {week: parse_time(commit.week), amount: commit.total}
    end
  end

  def self.language_data(user_name, repo_name)
    service.language_data(user_name, repo_name).map do |name, size|
      {"label" => name, "value" => size}
    end
  end

  def self.contributor_data(user_name, repo_name)
    service.contributor_data(user_name, repo_name).map do |contribution|
      {label: contribution.author.login, value: contribution.total}
    end
  end

  def self.code_frequency(user_name, repo_name)
    service.code_frequency(user_name, repo_name).map do |week|
      {name: week[0], value: week[1], value2: week[2]}
    end
  end

  def self.pull_requests(user_name, repo_name)
    stuff = service.pull_requests(user_name, repo_name).map(&:state).inject(Hash.new(0)) {|hash,word| hash[word] += 1; hash}
    stuff.map do |state, count|
      {"label" => state, "value" => count}
    end
  end

  def self.parse_time(time)
    DateTime.strptime(time.to_s, '%s').strftime("%e-%b-%y")
  end
end
