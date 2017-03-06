class CreatePlanets < ActiveRecord::Migration[5.0]
  def change
    create_table :planets do |t|
      t.string :name
      t.integer :position_x
      t.integer :position_y
      t.integer :position_z
      t.integer :nb_cases

      t.timestamps
    end
  end
end
