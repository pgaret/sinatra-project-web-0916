require 'bundler/setup'
Bundler.require

require_all('app/')

set :database, {adapter: "sqlite3", database: "db/database.sqlite3"}

require 'yelp'

Yelp.client.configure do |config|
  config.consumer_key = 'C4fh_NV1tNBMvCnUK8IydA'
  config.consumer_secret = '7X7nXAegqhPkyDB027B-QB2o3nU'
  config.token = 'HmF4W12ct6ImU1F1NncZ2NKXq03Fv4xh'
  config.token_secret = 'EiFKpYXlwtff86NM-L9eQN_dlLM'
end

# test = Yelp.client.search('San Fransisco')
#
# binding.pry
#
# test = 3
