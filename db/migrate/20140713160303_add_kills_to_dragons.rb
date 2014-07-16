class AddKillsToDragons < ActiveRecord::Migration
  def change
    add_column :dragons, :kills, :integer
  end
end
