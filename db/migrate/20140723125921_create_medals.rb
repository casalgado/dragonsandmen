class CreateMedals < ActiveRecord::Migration
  def change
    create_table :medals do |t|

      t.timestamps
    end
  end
end
