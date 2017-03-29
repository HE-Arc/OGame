class CreateBuildings < ActiveRecord::Migration[5.0]
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :description
      
      t.integer :costMoney
      t.integer :costMetal
      
      t.integer :metalFarmPerMinute
      t.integer :energyFarmPerMinute

      t.timestamps
    end
  end
end
