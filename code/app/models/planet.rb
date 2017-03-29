class Planet < ApplicationRecord
  has_many :buildings
  has_many :defenses
  has_many :spaceships
  belongs_to :user, optional: true
  belongs_to :solarsystem

  def distanceto(planet)

    ssvalue =  Math.sqrt((position_x-planet.position_x)**2+
           (position_y-planet.position_y)**2+
           (position_z-planet.position_z)**2)

    uvalue = Math.sqrt((solarsystem.position_x-planet.solarsystem.position_x)**2+
                           (solarsystem.position_y-planet.solarsystem.position_y)**2+
                           (solarsystem.position_z-planet.solarsystem.position_z)**2)

    return ssvalue, uvalue
  end
end
