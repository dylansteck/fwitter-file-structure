class AddColumnToTweets < ActiveRecord::Migration
  def up
		#create a comumn called user_id
		create_column created_at
		create_column created_on
  end
end
	def down
	end
end
