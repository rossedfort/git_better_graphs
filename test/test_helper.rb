ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'simplecov'
require 'capybara/rails'
require 'minitest/pride'
require 'database_cleaner'
require 'webmock'
require 'vcr'
require 'mocha/mini_test'

class ActiveSupport::TestCase
  include Capybara::DSL
  SimpleCov.start("rails")
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  VCR.configure do |config|
    config.cassette_library_dir = "test/cassettes"
    config.hook_into :webmock
  end

  def setup
    DatabaseCleaner.start
    Capybara.app = GitBetterGraphs::Application
  end

  def teardown
    DatabaseCleaner.clean
  end

  def parsed_response
    JSON.parse(response.body)
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      uid: "11775628",
      extra: {
        raw_info: {
          login: "rossedfort",
        },
      },
      info: {
              name: "Ross Edfort",
              nickname: "ross_edfort"
            },
      credentials: {
        token: ENV['github_key'],
        secret: ENV['github_secret']
      }
    })
  end

  def stub_current_user
    ApplicationController.any_instance.stubs(:current_user).returns(User.first)
  end
end
