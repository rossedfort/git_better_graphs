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
    service.repo_data(user).map { |repo| {label: repo.name, value: repo.size} }
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
end
