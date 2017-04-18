class Planet < ApplicationRecord
  has_and_belongs_to_many :buildings
  has_and_belongs_to_many :defenses
  has_and_belongs_to_many :spaceships
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

  def getBuilding()
    self.buildings
  end


  def construct(building, buyMethod)
    if(self.getCaseprise < self.nb_cases) then
      if(buyMethod == 0) then
        if(self.user.metal >= building.costMetal) then
          self.buildings.push(building)
          self.user.metal -= building.costMetal
          self.user.save
          return true
        elsif (buyMethod == 1) then
          if(self.user.money >= building.costMoney) then
            self.buildings.push(building)
            self.user.money -= building.costMoney
            self.user.save
            return true
          end
        end
      end
    end
  end

  def getCaseprise()
    caseprise = self.buildings.count + self.defenses.count
    return caseprise
  end

  def conquer(attacker)

      self.user = attacker
      self.save
  end

end
