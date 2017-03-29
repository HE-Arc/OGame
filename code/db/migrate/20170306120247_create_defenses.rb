class CreateDefenses < ActiveRecord::Migration[5.0]
  def change
    create_table :defenses do |t|
      t.string :name
      t.string :description
      
      t.integer :costMoney
      t.integer :costMetal
      
      t.boolean :isActive
      t.integer :points

      t.timestamps
    end
  end
end
