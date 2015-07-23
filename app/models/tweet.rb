class Tweet < ActiveRecord::Base
	belongs_to :user
	has_many :tweets
	
	#Tweet.all
	#Tweet.find
	#Tweet.find_by
	#Tweet.find_by_sql
	# .update
	#Tweet.create
	#ActiveRecord commands(only some)^^
end



