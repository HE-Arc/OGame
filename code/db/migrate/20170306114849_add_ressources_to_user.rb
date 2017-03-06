class AddRessourcesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :metal, :integer
    add_column :users, :energy, :integer
    add_column :users, :money, :integer
  end
end
