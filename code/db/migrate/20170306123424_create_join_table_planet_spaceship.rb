class CreateJoinTablePlanetSpaceship < ActiveRecord::Migration[5.0]
  def change
    create_join_table :planets, :spaceships do |t|
      # t.index [:planet_id, :spaceship_id]
      # t.index [:spaceship_id, :planet_id]
    end
  end
end
