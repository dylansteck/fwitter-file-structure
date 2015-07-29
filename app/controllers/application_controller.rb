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
			 erb :index
		 else
			 erb :tweetandfield
    end
		erb :index
  end
	
	post '/' do
		@newuser = User.new ({:username => params[:username], :password => params[:password]})
		@users = User.all
		@newuser.save
		if @newuser
			session[:user_id] = @newuser.id
			redirect ("/tweetandfield")
    else
      erb :error
    end
	end
	

	
	
	get  '/tweetandfield' do
		@users = User.all
		@tweets = Tweet.all
		@user = User.find_by_id session[:user_id]
		erb :tweetandfield
	end
	
	post'/tweetandfield' do
		@tweet = Tweet.new({:username=> session[:username], :tweet => params[:tweet]})
		@tweet.save
		redirect ('/tweetandfield')
	end
	
	get '/logout' do
		 session[:user_id] = nil
		redirect ('/')
	end
	
	post '/logout' do
		redirect('/')
	end
end