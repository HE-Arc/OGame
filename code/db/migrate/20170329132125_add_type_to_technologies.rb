class AddTypeToTechnologies < ActiveRecord::Migration[5.0]
  def change
    add_column :technologies, :typeTech, :string
  end
end
