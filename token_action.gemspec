require File.expand_path('../lib/token_action/version', __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "token_action"
  s.version     = TokenAction::VERSION
  s.authors     = ["Open North"]
  s.email       = ["info@opennorth.ca"]
  s.homepage    = "http://github.com/opennorth/token_action"
  s.summary     = "Redeem tokens to perform actions."

  s.files = Dir["{app,config,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '~> 3.1'
  s.add_dependency 'orm_adapter', '~> 0.1'

  s.add_development_dependency 'database_cleaner', '~> 0.9'
  s.add_development_dependency 'guard-brakeman', '~> 0.5'
  s.add_development_dependency 'guard-bundler', '~> 1.0'
  s.add_development_dependency 'guard-rspec', '~> 2.1'
  s.add_development_dependency 'guard-spork', '~> 1.2'
  # https://github.com/guard/guard#os-x
  s.add_development_dependency 'rb-fsevent', '~> 0.9'
  s.add_development_dependency 'rspec-rails', '~> 2.11'
  s.add_development_dependency 'shoulda-matchers', '~> 1.4'
  s.add_development_dependency 'spork-rails', '~> 3.2'
  s.add_development_dependency 'sqlite3', '~> 1.3'

  if RUBY_VERSION < '1.9'
    s.add_development_dependency 'factory_girl_rails', '~> 1.7'
  else
    s.add_development_dependency 'factory_girl_rails', '~> 4.1'
    s.add_development_dependency 'mongoid', '~> 3.1.2'
    s.add_development_dependency 'mongoid-rspec', '~> 1.5'
    s.add_development_dependency 'coveralls'
  end
end
