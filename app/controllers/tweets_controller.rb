require './config/environment'

class TweetsController < ApplicationController
  configure do
    enable :sessions
    set :session_secret, "tweet_secret"
  end

  get '/tweets' do
    if logged_in?
      @tweets = Tweet.all
      erb :'tweets/tweets'
    else
      redirect to '/login'
    end
  end

end
