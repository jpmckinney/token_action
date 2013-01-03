module TokenAction
  module Generators
    # Run this generator once before using TokenAction in your application.
    #
    # @example
    #   rails generate token_action
    #
    # @see Devise::Generators::InstallGenerator
    # @see Devise::Generators::DeviseGenerator
    class TokenActionGenerator < Rails::Generators::Base
      desc "Copies TokenAction's initializer and locale files, adds routes, " <<
        "and creates an ActiveRecord migration file if necessary."

      hook_for :orm
      namespace 'token_action'
      source_root File.expand_path('../templates', __FILE__)

      def copy_initializer_file
        template 'token_action.rb', 'config/initializers/token_action.rb'
      end

      def copy_locale_file
        copy_file '../../../config/locales/en.yml', 'config/locales/token_action.en.yml'
      end

      def add_routes
        route "mount TokenAction::Engine => '/token_action'"
      end

      def show_readme
        readme 'README' if behavior == :invoke
      end
    end
  end
end
