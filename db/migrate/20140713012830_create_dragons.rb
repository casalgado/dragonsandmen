class CreateDragons < ActiveRecord::Migration
  def change
    create_table :dragons do |t|
      t.string :name
      t.integer :hp
      t.integer :atk

      t.timestamps
    end
  end
end
