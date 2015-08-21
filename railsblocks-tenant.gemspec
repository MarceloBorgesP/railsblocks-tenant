$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "railsblocks/tenant/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "railsblocks-tenant"
  s.version     = Railsblocks::Tenant::VERSION
  s.authors     = ["Celso Fernandes"]
  s.email       = ["fernandes@zertico.com"]
  s.homepage    = "http://domain.com"
  s.summary     = "Summary of Railsblocks::Tenant."
  s.description = "Description of Railsblocks::Tenant."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md", "spec/factories/**/*.rb"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3", '~> 1.3'
  s.add_development_dependency "codeclimate-test-reporter", '~> 0.4'
  s.add_development_dependency 'combustion', '~> 0.5.2'
  s.add_development_dependency "database_cleaner", '~> 1.4'
  s.add_development_dependency "factory_girl_rails", '~> 4.5'
  s.add_development_dependency "faker", "~> 1.4"
  s.add_development_dependency 'guard', '~> 2'
  s.add_development_dependency 'guard-rspec', '~> 4'
  s.add_development_dependency 'listen', '~> 2.7.12'
  s.add_development_dependency 'pry', '~> 0.10'
  s.add_development_dependency "rspec-rails", '~> 3.2'
  s.add_development_dependency "shoulda-matchers", '~> 2.8'
  s.add_development_dependency "thor", '~> 0.19'

end
