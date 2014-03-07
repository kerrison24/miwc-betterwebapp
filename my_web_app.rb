require 'sinatra'
require 'erb'
require_relative 'twitter_wrapper'

set :port, 5012
set :bind, '0.0.0.0'
set :server, 'webrick'

get '/' do
    @my_name = "Kerrison"
    @some_things = ["banana", "grape", "melon"]
    @other_things = ["peanuts", "peanut butter", "anything peanuts"]
    erb :index, layout: :bootstrap
end

#display 10 latest tweets based on a certain keyword/s

get '/love' do
    @love_tweets = TwitterWrapper.new(key, secret, token, tokensecret).search("love", :result_type => "recent")
    erb :love, layout: :bootstrap
end

get '/dogs' do
    @dog_tweets = TwitterWrapper.new(key, secret, token, tokensecret).search("dog", :result_type => "recent")
    erb :dogs, layout: :bootstrap
end

get '/cat' do
    @cat_tweets = TwitterWrapper.new(key, secret, token, tokensecret).search("cat", :result_type => "recent")
    erb :cat, layout: :bootstrap
end

get '/tweet' do
    TwitterWrapper.new(key, secret, token, tokensecret).update("Your tweet.")
    erb :tweet, layout: :bootstrap
end