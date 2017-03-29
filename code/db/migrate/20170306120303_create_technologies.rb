class CreateTechnologies < ActiveRecord::Migration[5.0]
  def change
    create_table :technologies do |t|
      t.string :name
      t.text :description
      
      t.integer :costMoney
      t.integer :costEnergy

      t.timestamps
    end
  end
end
