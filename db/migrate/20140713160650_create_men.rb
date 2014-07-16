class CreateMen < ActiveRecord::Migration
  def change
    create_table :men do |t|
      t.string :name
      t.integer :hp
      t.integer :atk
      t.integer :kills
      t.integer :deaths

      t.timestamps
    end
  end
end
