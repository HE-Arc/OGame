class Planet < ApplicationRecord
  has_and_belongs_to_many :buildings
  has_many :defenses
  has_many :spaceships
  belongs_to :user, optional: true
  belongs_to :solarsystem

  def distanceto(planet)

    #TODO fix distance if system changed
    ssvalue =  Math.sqrt((position_x-planet.position_x)**2+
           (position_y-planet.position_y)**2+
           (position_z-planet.position_z)**2)

    uvalue = Math.sqrt((solarsystem.position_x-planet.solarsystem.position_x)**2+
                           (solarsystem.position_y-planet.solarsystem.position_y)**2+
                           (solarsystem.position_z-planet.solarsystem.position_z)**2)

    return ssvalue, uvalue
  end

  def getBuilding()
    self.buildings
  end

  def construct(building)
    if(self.buildings.count)
      self.buildings.push(building)
    end
  end
end
