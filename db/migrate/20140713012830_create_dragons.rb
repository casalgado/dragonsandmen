class CreateDragons < ActiveRecord::Migration
  def change
    create_table :dragons do |t|
      t.string     :name
      t.integer    :hp,     default: 100
      t.integer    :atk,    default: 10
      t.integer    :deaths, default: 0
      t.integer    :kills,  default: 0
      t.references :user
      t.timestamps
    end
  end
end
