module ActiveRecord
  module Generators
    # This generator will run during `rails generate token_action`.
    #
    # @see ActiveRecord::Generators::DeviseGenerator
    # @see Devise::Generators::OrmHelpers
    class TokenActionGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def copy_migration_file
        migration_template 'migration.rb', 'db/migrate/create_token_action_tokens'
      end
    end
  end
end
