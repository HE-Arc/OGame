class AddUserRefToPlanets < ActiveRecord::Migration[5.0]
  def change
    add_reference :planets, :user, foreign_key: true, null: true
  end
end
