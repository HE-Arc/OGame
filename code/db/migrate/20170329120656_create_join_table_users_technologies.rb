class CreateJoinTableUsersTechnologies < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :technologies do |t|
      # t.index [:user_id, :technology_id]
      # t.index [:technology_id, :user_id]
    end
  end
end
