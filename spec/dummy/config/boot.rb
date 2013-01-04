# @see https://github.com/plataformatec/devise/blob/master/test/rails_app/config/boot.rb
unless defined?(TOKEN_ACTION_ORM)
  TOKEN_ACTION_ORM = (ENV['TOKEN_ACTION_ORM'] || :active_record).to_sym
end

require 'rubygems'
gemfile = File.expand_path('../../../../Gemfile', __FILE__)

if File.exist?(gemfile)
  ENV['BUNDLE_GEMFILE'] = gemfile
  require 'bundler'
  Bundler.setup
end

$:.unshift File.expand_path('../../../../lib', __FILE__)