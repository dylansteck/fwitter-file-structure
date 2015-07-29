class AddColumnToTweets < ActiveRecord::Migration
  def up
		#create a comumn called user_id
		add_column :tweets, :created_at, :string
		add_column :tweets, :created_on, :string
  end
	def down
	end
end
