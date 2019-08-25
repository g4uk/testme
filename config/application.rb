require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Testme
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.api_only = true

    config.generators do |g|
      g.test_framework  :rspec
      g.integration_tool :rspec
    end

    config.paths.add 'lib', eager_load: false, autoload: true
    config.active_record.schema_format = :sql
  end
end
