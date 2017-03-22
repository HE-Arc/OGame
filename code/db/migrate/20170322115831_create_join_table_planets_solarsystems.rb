class CreateJoinTablePlanetsSolarsystems < ActiveRecord::Migration[5.0]
  def change
    create_join_table :planets, :solarsystems do |t|
      # t.index [:planet_id, :solarsystem_id]
      # t.index [:solarsystem_id, :planet_id]
    end
  end
end
