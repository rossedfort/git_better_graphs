Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, ENV['github_key_pro'], ENV['github_secret_pro']
end
