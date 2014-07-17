class AddDeathsToDragons < ActiveRecord::Migration
  def change
    add_column :dragons, :deaths, :integer
  end
end
