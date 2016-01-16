class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.nickname           = auth_info.extra.raw_info.login
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
    end
  end

  def self.service
    GithubService.new
  end

  def self.search(user)
    service.search(user)
  end

  def self.repo_data(user)
    service.repo_data(user)
  end

  def self.followers(user)
    service.followers(user)
  end

  def self.following(user)
    service.following(user)
  end

  def self.data(user)
    service.data(user)
  end

  def self.specific_repo_data(user_name, repo_name)
    service.specific_repo_data(user_name, repo_name)
  end

  def self.commit_data(user_name, repo_name)
    service.commit_data(user_name, repo_name).map(&:total).reduce(:+)
  end

  def self.commit_activity(user_name, repo_name)
    service.commit_data(user_name, repo_name).map do |commit|
      {week: commit.week, amount: commit.total}
    end
  end

  def self.language_data(user_name, repo_name)
    service.language_data(user_name, repo_name)
  end

  def self.contributor_data(user_name, repo_name)
    service.contributor_data(user_name, repo_name)
  end

  def self.parse_time(time)
    DateTime.strptime(time.to_s, '%s')
  end
end
