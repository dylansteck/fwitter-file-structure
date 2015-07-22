class Tweet
  ALL_TWEETS = [] 
	attr_accessor  :content, :time, :date
	def initialize(content, date=Time.now.strftime("%D"), time=Time.now.strftime("%I:%M:%S:%p %Z"))
    @content = content
		@time = time
		@date = date
    ALL_TWEETS.push(self)
  end
 
  def self.all
    ALL_TWEETS
  end
  
end



