class User < ApplicationRecord
  has_secure_password
  has_many :planets
  has_one :planet

  has_and_belongs_to_many :technologies

  def self.update_ressources()
    User.all.each do |u|
      u.planets.each do |p|
        p.buildings.each do |b|
          if b.metalFarmPerMinute != nil then
            u.metal += b.metalFarmPerMinute
          end

          if b.energyFarmPerMinute != nil then
            u.energy += b.energyFarmPerMinute
          end
        end
      end
      u.save
    end
  end
end
