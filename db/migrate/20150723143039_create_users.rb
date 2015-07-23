class CreateUsers < ActiveRecord::Migration
	def up :users do |t|
		t.string :username
		t.string :bio
		t.string :password
  end
	def down
		drop_table :username
end
