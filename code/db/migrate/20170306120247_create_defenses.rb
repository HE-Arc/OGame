class CreateDefenses < ActiveRecord::Migration[5.0]
  def change
    create_table :defenses do |t|
      t.string :name
      t.integer :type

      t.timestamps
    end
  end
end
