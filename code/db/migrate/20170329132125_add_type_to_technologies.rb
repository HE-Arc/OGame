class AddTypeToTechnologies < ActiveRecord::Migration[5.0]
  def change
    add_column :technologies, :type, :string
  end
end
