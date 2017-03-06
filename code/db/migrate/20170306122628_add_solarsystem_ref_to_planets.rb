class AddSolarsystemRefToPlanets < ActiveRecord::Migration[5.0]
  def change
    add_reference :planets, :solarsystem, foreign_key: true
  end
end
