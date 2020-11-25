$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "accounting/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "accounting"
  spec.version     = Accounting::VERSION
  spec.authors     = "Edgardo Martin Gerez"
  spec.email       = "edmargerez@gmail.com"
  spec.homepage    = "https://github.com/martinGerez/accounting"
  spec.summary     = "Double entry system."
  spec.description = "Accounting is a double entry system, that tries to make business accounting simple."
  spec.license     = "MIT"
  spec.required_ruby_version = '>= 2.5'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.4"
  
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "factory_bot"
  spec.add_development_dependency "database_cleaner"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "standard"
end
