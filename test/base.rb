ENV['RACK_ENV'] = 'test'
ENV['ENV'] = 'test'

require './app'
require 'test/unit'
require 'rack/test'
require 'database_cleaner'
require 'factory_girl'

DatabaseCleaner.strategy = :truncation

# then, whenever you need to clean the DB
DatabaseCleaner.clean

ActiveRecord::Migration.maintain_test_schema!

class TestBase < Test::Unit::TestCase
  include Rack::Test::Methods
  include FactoryGirl::Syntax::Methods

  setup :each do
    DatabaseCleaner.start
    FactoryGirl.reload
  end

  teardown :each do
    DatabaseCleaner.clean
  end

  def app
    App.new
  end

  # def test_it_says_hello_to_a_person
  #   get '/', :name => 'Simon'
  #   assert last_response.body.include?('Simon')
  # end
end
