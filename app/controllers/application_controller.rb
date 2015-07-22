require_relative "../../config/environment"
require_relative "../models/tweet.rb"
require_relative "../models/user.rb"
class ApplicationController < Sinatra::Base
  
  set :views, "app/views"
  set :public, "public"
  
  get "/" do
#     @tweet = Tweet.new("Richard Stamina", "Rold Gold makes me feel like cold mold")
#     erb :tweets
		erb :index
  end
	post '/tweet' do
		@user= User.new(params[:username], params[:password])
		#params
		erb :tweet
	end

	post '/results' do
		@user= User.new(params[:username], params[:password])
		@tweet = Tweet.new(params[:tweet])
		#params 
		erb :results
	end
end