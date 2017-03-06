class CreateJoinTablePlanetBuilding < ActiveRecord::Migration[5.0]
  def change
    create_join_table :planets, :buildings do |t|
      # t.index [:planet_id, :building_id]
      # t.index [:building_id, :planet_id]
    end
  end
end
