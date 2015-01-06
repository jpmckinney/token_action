require File.expand_path('../lib/token_action/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "token_action"
  s.version     = TokenAction::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["James McKinney"]
  s.homepage    = "http://github.com/jpmckinney/token_action"
  s.summary     = %q{Redeem tokens to perform actions.}
  s.license     = 'MIT'

  s.files         = Dir["{app,config,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.add_dependency('rails', '~> 3.1')
  s.add_dependency('orm_adapter', '~> 0.1')

  s.add_development_dependency('database_cleaner', '~> 0.9')
  s.add_development_dependency('guard-brakeman', '~> 0.5')
  s.add_development_dependency('guard-bundler', '~> 1.0')
  s.add_development_dependency('guard-rspec', '~> 2.1')
  s.add_development_dependency('guard-spork', '~> 1.2')
  # https://github.com/guard/guard#os-x
  s.add_development_dependency('rb-fsevent', '~> 0.9')
  s.add_development_dependency('rspec-rails', '~> 2.11')
  s.add_development_dependency('shoulda-matchers', '~> 1.4')
  s.add_development_dependency('spork-rails', '~> 3.2')
  s.add_development_dependency('sqlite3', '~> 1.3')
  s.add_development_dependency('coveralls')

  if RUBY_VERSION < '1.9'
    s.add_development_dependency('factory_girl_rails', '~> 1.7')
  else
    s.add_development_dependency('factory_girl_rails', '~> 4.1')
    s.add_development_dependency('mongoid', '~> 3.1.2')
    s.add_development_dependency('mongoid-rspec', '~> 1.5')
  end
end
