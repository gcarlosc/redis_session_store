require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ManualSession
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # config.session_store :redis_session_store, {
    #   key: "_sperant_session",
    #   redis: {
    #     # expire_after: 10.seconds,
    #     url: "#{ENV['REDIS_URL']}/1",
    #     key_prefix: 'session_'
    #   },
    #   on_redis_down: ->(e, env, sid) { Rails.logger.info "on_redis_down => #{e} #{sid}" },
    #   on_session_load_error: ->(e, sid) { Rails.logger.info "on_session_load_error => #{e}" }
    # }

    # config.session_store :cache_store, key: '_redis', options: { url: "#{ENV['REDIS_URL']}/1", key_prefix: 'session_' }

    # config.action_controller.perform_caching = true
    # config.cache_store = :redis_cache_store, { url: "#{ENV['REDIS_URL']}/2" }
    # config.session_store :cache_store, key: '_redis_session'

    config.session_store :redis_store, {
      servers: [
        { host: 'localhost', port: 6379, db: 1 },
      ],
      key: '_some_session_key'
    }

  end
end
