class User
	ALL_USERS= []
	attr_accessor :username, :password
	def initialize(username, password)
		@username= username
		@password= password
		ALL_USERS.push(self)
	end
	 def self.all
    ALL_USERS
  end
end