class AddColumnToTweets < ActiveRecord::Migration
  def up
		#create a comumn called user_id
		add_column created_at created_at
		add_column created_on created_on
  end
end
	def down
	end
end
