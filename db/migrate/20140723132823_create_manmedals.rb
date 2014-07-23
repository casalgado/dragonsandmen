class CreateManmedals < ActiveRecord::Migration
  def change
    create_table :manmedals do |t|
      t.string  :type_of_medal
      t.integer :man_id

      t.timestamps
    end
  end
end
