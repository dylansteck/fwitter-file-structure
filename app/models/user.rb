require 'bcrypt'
require_relative "../models/tweet.rb"
class User < ActiveRecord::Base
	has_many :tweets
end