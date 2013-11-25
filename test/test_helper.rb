ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require 'capybara/rails'

# from https://github.com/plataformatec/devise/wiki/How-To:-Test-with-Capybara
include Warden::Test::Helpers
Warden.test_mode!

class ActionController::TestCase
  include Devise::TestHelpers
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
end

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You"ll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # email helpers

  def last_email_sent_to email_address
    ActionMailer::Base.deliveries.select { |email| email.to[0] == email_address }.last
  end

  def visit_link_in email: email, link_text: link_text
    email_links = URI.extract email.body.to_s, ['http', 'https']
    url = email_links.find { |link| link == link_text }
    url ? visit(url) : raise("Link '#{link_text}' not found in '#{email.body}'")
  end

  # fixture helpers

  def joe
    users :joe
  end

  def joe_larp
    larps :joe_larp
  end

  def jack
    users :jack
  end

end
