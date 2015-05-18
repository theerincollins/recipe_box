ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default)

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file}

RSpec.configure do |config|
  config.include Capybara::DSL
  config.after(:each) do
    Recipe.all().each do |recipe|
      recipe.destroy()
    end
    Category.all().each do |category|
      category.destroy()
    end
  end
end
