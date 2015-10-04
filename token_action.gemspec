# -*- encoding: utf-8 -*-
require File.expand_path('../lib/token_action/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "token_action"
  s.version     = TokenAction::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["James McKinney"]
  s.homepage    = "https://github.com/jpmckinney/token_action"
  s.summary     = %q{Redeem tokens to perform actions.}
  s.license     = 'MIT'

  s.files         = Dir["{app,config,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.add_runtime_dependency('rails', '~> 4.2.0')
  s.add_runtime_dependency('orm_adapter', '~> 0.1')

  s.add_development_dependency('coveralls')
  s.add_development_dependency('database_cleaner', '~> 1.5.0')
  s.add_development_dependency('factory_girl_rails', '~> 4.1')
  s.add_development_dependency('guard-bundler', '~> 2.0')
  s.add_development_dependency('guard-rspec', '~> 4.6')
  s.add_development_dependency('mongoid', '~> 5.0.0')
  s.add_development_dependency('mongoid-rspec', '~> 3.0.0')
  s.add_development_dependency('pry-rails')
  s.add_development_dependency('rspec-rails', '~> 3.3')
  s.add_development_dependency('shoulda-matchers', '~> 3.0')
  s.add_development_dependency('sqlite3', '~> 1.3')
end
