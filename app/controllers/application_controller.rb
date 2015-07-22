require_relative "../../config/environment"
require_relative "../models/tweet.rb"
class ApplicationController < Sinatra::Base
  
  set :views, "app/views"
  set :public, "public"
  
  get "/" do
		erb :index
  end

	post '/results' do
		@tweet = Tweet.new({:username => params[:username], content => params[:tweet]})
		@tweet.save 
		erb :results
	end
end