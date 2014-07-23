class AddExpToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :user_money, :integer, default: 10
  end
end
