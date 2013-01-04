require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'

  # @see https://github.com/plataformatec/devise/blob/master/test/test_helper.rb
  TOKEN_ACTION_ORM = (ENV['TOKEN_ACTION_ORM'] || :active_record).to_sym
  puts "\n==> Running specs with #{TOKEN_ACTION_ORM}"

  require 'rails/application'
  # Prevent Spork from caching the routes.
  Spork.trap_method(Rails::Application::RoutesReloader, :reload!)
  # Prevent Spork from caching the engine's classes (see below).
  Spork.trap_method(Rails::Application, :eager_load!)

  require File.expand_path("../dummy/config/environment.rb",  __FILE__)
  require 'rspec/rails'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[File.expand_path("../support/**/*.rb", __FILE__)].each {|f| require f}

  # Prevent Spork from caching the engine's classes (see above).
  Rails.application.railties.all do |railtie|
    unless railtie.respond_to?(:engine_name) && railtie.engine_name == 'token_action'
      railtie.eager_load!
    end
  end

  require 'database_cleaner'
  require 'factory_girl_rails'

  case TOKEN_ACTION_ORM
  when :active_record
    require 'shoulda/matchers'
  when :mongoid
    require 'mongoid-rspec'

    # Create non-engine indexes.
    Rails.application.railties.engines.each do |engine|
      unless engine.engine_name == 'popolo'
        engine.paths["app/models"].expanded.each do |path|
          Rails::Mongoid.create_indexes("#{path}/**/*.rb")
        end
      end
    end
  end

  RSpec.configure do |config|
    if TOKEN_ACTION_ORM == :mongoid
      config.include Mongoid::Matchers
    end

    config.mock_with :rspec

    # http://railscasts.com/episodes/285-spork
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.run_all_when_everything_filtered = true
    config.filter_run focus: true
  end
end

Spork.each_run do
  # It's now okay to load the engine.
  Rails.application.railties.engines.each do |engine|
    if engine.engine_name == 'token_action'
      engine.eager_load!
    end
  end

  case TOKEN_ACTION_ORM
  when :active_record
    ActiveRecord::Migrator.migrate(File.expand_path("../dummy/db/migrate/", __FILE__))
  when :mongoid
    # DatabaseCleaner will not truncate system.indexes between tests, but it
    # should be truncated before running the full test suite.
    Mongoid::Sessions.default.drop

    # Create the engine's indexes.
    Rails.application.railties.engines.each do |engine|
      if engine.engine_name == 'token_action'
        engine.paths["app/models"].expanded.each do |path|
          Rails::Mongoid.create_indexes("#{path}/**/*.rb")
        end
      end
    end

    # Create dummy indexes.
    Rails::Mongoid.create_indexes(File.expand_path("../dummy/app/models/**/*.rb", __FILE__))
  end

  # @todo I18n.backend.reload!
  FactoryGirl.reload
end
