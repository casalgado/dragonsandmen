class CreateMen < ActiveRecord::Migration
  def change
    create_table :men do |t|
      t.string     :name
      t.integer    :hit_points,    default: 100
      t.integer    :damage,        default: 10
      t.integer    :kills,         default: 0
      t.integer    :deaths,        default: 0
      t.integer    :level,         default: 1
      t.datetime   :time_of_death, default: Time.now
      t.references :user
      t.timestamps
    end
  end
end
