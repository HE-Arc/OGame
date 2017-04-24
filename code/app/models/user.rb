class User < ApplicationRecord
  has_secure_password
  has_many :planets
  has_one :planet

  has_and_belongs_to_many :technologies

  def self.update_ressources()
    # XXX Combien de fois: SELECT FROM technologies WHERE name = $1 est fait?
    # - O(n)
    # - O(n^2)
    # - O(n^3)
    # - O(n^4)
    User.all.each do |u|
      u.planets.each do |p|
        p.buildings.each do |b|
          if b.name == "Mine de métal" then
            if u.technologies.include? Technology.where(name: "Perceuse").take then
              u.metal += b.metalFarmPerMinute * 5
            else
              u.metal += b.metalFarmPerMinute
            end
          end

          if b.name == "Extracteur d'énergie" then
            if u.technologies.include? Technology.where(name: "Roue à pterodactyles").take then
              u.energy += b.energyFarmPerMinute * 5
            else
              u.energy += b.energyFarmPerMinute
            end
          end
        end
      end
      u.save
    end
  end
end
