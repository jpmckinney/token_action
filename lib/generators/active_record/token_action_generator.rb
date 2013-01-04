require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    # This generator will run during `rails generate token_action`.
    #
    # @see ActiveRecord::Generators::DeviseGenerator
    # @see Devise::Generators::OrmHelpers
    class TokenActionGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      def copy_migration_file
        migration_template 'migration.rb', 'db/migrate/create_token_action_tokens'
      end

    private

      def self.next_migration_number(number)
        ActiveRecord::Generators::Base.next_migration_number(number)
      end
    end
  end
end
