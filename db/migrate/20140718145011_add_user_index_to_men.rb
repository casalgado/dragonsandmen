class AddUserIndexToMen < ActiveRecord::Migration
  def change
  	add_index :men, :user_id
  end
end
