class CreateJoinTableUserPlanet < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :planets do |t|
      # t.index [:user_id, :planet_id]
      # t.index [:planet_id, :user_id]
    end
  end
end
