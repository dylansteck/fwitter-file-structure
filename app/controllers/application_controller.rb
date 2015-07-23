require_relative "../../config/environment"
require_relative "../models/tweet.rb"
require_relative "../models/timestamp.rb"
class ApplicationController < Sinatra::Base
  
  set :views, "app/views"
  set :public, "public"
  
  get "/" do
		@tweet = Tweet.new({:username => params[:username], :tweet => params[:tweet]})
		@tweet.save
		@tweets = Tweet.all
		erb :index
  end

	post '/' do
			@tweet = Tweet.new({:username => params[:username], :tweet => params[:tweet]})
		@tweet.save
		@tweets = Tweet.all
		config.active_record.default_timezone = :local
		erb :index
	end
	
end