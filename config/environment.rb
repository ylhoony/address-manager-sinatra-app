ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, :development)

ActiveRecord::Base.connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV["SINATRA"]}.sqlite"
)

require_all 'app'
