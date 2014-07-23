class CreateDragonmedals < ActiveRecord::Migration
  def change
    create_table :dragonmedals do |t|
      t.string  :type_of_medal
      t.integer :dragon_id

      t.timestamps
    end
  end
end
