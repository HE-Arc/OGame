class User < ApplicationRecord
  has_secure_password
  has_many :planets
  has_one :planet

  has_and_belongs_to_many :technologies

  def self.update_ressources()
    User.all.each do |u|
      u.buildings.each do |b|
        u.metal += b.metalFarmPerMinute
        u.energy += b.energyFarmPerMinute
      end
      u.save
    end
  end
end
