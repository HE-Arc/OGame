class CreateJoinTablePlanetDefense < ActiveRecord::Migration[5.0]
  def change
    create_join_table :planets, :defenses do |t|
      # t.index [:planet_id, :defense_id]
      # t.index [:defense_id, :planet_id]
    end
  end
end
