$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "token_action/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "token_action"
  s.version     = TokenAction::VERSION
  s.authors     = ["Open North"]
  s.email       = ["info@opennorth.ca"]
  s.homepage    = "http://github.com/opennorth/token_action"
  s.summary     = ""

  s.files = Dir["{app,config,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '~> 3.2.9'

  s.add_development_dependency 'database_cleaner', '~> 0.9'
  s.add_development_dependency 'factory_girl_rails', '~> 4.1'
  s.add_development_dependency 'guard-brakeman', '~> 0.5'
  s.add_development_dependency 'guard-bundler', '~> 1.0'
  s.add_development_dependency 'guard-rspec', '~> 2.1'
  s.add_development_dependency 'guard-spork', '~> 1.2'
  # https://github.com/guard/guard#os-x
  s.add_development_dependency 'rb-fsevent', '~> 0.9'
  s.add_development_dependency 'rspec-rails', '~> 2.11'
  s.add_development_dependency 'spork-rails', '~> 3.2'
end