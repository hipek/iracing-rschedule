require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ischedule
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end

    config.generators do |g|
      g.test_framework :rspec, fixture_replacement: 'factory_girl', view_specs: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.template_engine :haml
      g.assets = false
    end
  end
end
