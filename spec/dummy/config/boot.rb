# @see https://github.com/plataformatec/devise/blob/master/test/rails_app/config/boot.rb
unless defined?(TOKEN_ACTION_ORM)
  TOKEN_ACTION_ORM = (ENV['TOKEN_ACTION_ORM'] || :active_record).to_sym
end

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../../../Gemfile', __FILE__)

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])
$LOAD_PATH.unshift File.expand_path('../../../../lib', __FILE__)
