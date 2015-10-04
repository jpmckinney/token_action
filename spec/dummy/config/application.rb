require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)
require "token_action"

case TOKEN_ACTION_ORM
when :active_record
  require "active_record/railtie"
when :mongoid
  require "mongoid"
end

module Dummy
  class Application < Rails::Application
    # @see https://github.com/plataformatec/devise/blob/master/test/rails_app/config/application.rb
    config.autoload_paths += %W(#{config.root}/app/#{TOKEN_ACTION_ORM})

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    if TOKEN_ACTION_ORM == :active_record
      config.active_record.raise_in_transactional_callbacks = true
    end
  end
end

