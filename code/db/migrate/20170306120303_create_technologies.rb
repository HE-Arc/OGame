class CreateTechnologies < ActiveRecord::Migration[5.0]
  def change
    create_table :technologies do |t|
      t.string :name
      t.integer :type
      t.text :description
      t.integer :cost

      t.timestamps
    end
  end
end
