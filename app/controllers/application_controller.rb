require_relative "../../config/environment"
require_relative "../models/tweet.rb"
require_relative "../models/user.rb"
class ApplicationController < Sinatra::Base
  
  set :views, "app/views"
  set :public, "public"
	
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
		enable :sessions
    set :session_secret, "fwitter"
  end
	
	get'/' do
		 if session[:user_id] == nil
			 @tweets= Tweet.all
			 erb :login
		 else
			 erb :index
    end
		erb :index
  end
	
	post '/newuser' do
		
		@newuser = User.new ({:username => params[:username], :bio => params[:bio], :password => params[:password]})
		@newuser.save
		redirect ('/login')
	end
	
	get '/login' do
		erb :login
	end
	
	post '/login' do
		@newuser = User.find_by ({:username => params[:username], :password => params[:password]})
		@users = User.all
			@tweet = Tweet.new({:username => params[:username], :tweet => params[:tweet]})
		@tweet.save
		@tweets = Tweet.all
		if @newuser
			session[:user] = @newuser.username  
			erb :tweetandfield
    else
      erb :error
    end
	end
	
	get  '/tweetandfield' do
			@newuser = User.new ({:username => params[:username], :bio => params[:bio], :password => params[:password]})
		@users = User.all
			@tweet = Tweet.new({:username => session[:user], :tweet => params[:tweet]})
		@tweets = Tweet.all
		erb :tweetandfield
	end
	
	post'/tweetandfield' do
		@newuser = User.new ({:username => session[:user], :bio => params[:bio], :password => params[:password]})
		@users = User.all
		@tweets = Tweet.all
		erb :tweetandfield
	end
end