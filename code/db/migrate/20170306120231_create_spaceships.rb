class CreateSpaceships < ActiveRecord::Migration[5.0]
  def change
    create_table :spaceships do |t|
      t.string :name
      t.string :description
      
      t.integer :costMoney
      t.integer :costMetal
      
      t.integer :energyTank
      t.integer :attackPoints

      t.timestamps
    end
  end
end
