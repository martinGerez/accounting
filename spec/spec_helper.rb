require "simplecov"
SimpleCov.start do
  add_filter "/spec/"
end

require "active_record"
puts "Testing with ActiveRecord #{ActiveRecord::VERSION::STRING}"
ActiveRecord::Base.configurations = YAML.load_file(File.expand_path('database.yml', File.dirname(__FILE__)))
ActiveRecord::Base.establish_connection(:sqlite)
ActiveRecord::Migration.verbose = false

require "database_cleaner"
require "accounting"
require "generators/accounting/migration/templates/migration.rb"

require "factory_bot"
FactoryBot.find_definitions

# Avoid warning message
I18n.enforce_available_locales = false

Dir[File.expand_path(File.join(File.dirname(__FILE__), "support", "**", "*.rb"))].each { |f| require f }

RSpec.configure do |config|
  config.before(:suite) do
    AccountingMigration.up
    SpecMigration.up

    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.after(:suite) do
    AccountingMigration.down
    SpecMigration.down
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
