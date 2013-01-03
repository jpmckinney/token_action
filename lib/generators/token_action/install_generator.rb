module TokenAction
  module Generators
    # Run this generator once before using TokenAction in your application.
    #
    # @example
    #   rails generate token_action:install
    #
    # @see Devise::Generators::InstallGenerator
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc "Copies TokenAction's initializer and locale files to your application."
      class_option :orm

      def copy_initializer_file
        template 'token_action.rb', 'config/initializers/token_action.rb'
      end

      def copy_locale_file
        copy_file '../../../config/locales/en.yml', 'config/locales/token_action.en.yml'
      end

      def show_readme
        readme 'README' if behavior == :invoke
      end
    end
  end
end
