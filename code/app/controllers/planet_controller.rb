class PlanetController < ApplicationController
  before_action :checklabo?, :checkspatioport?, :checkministere?

  def index
    @solarsystems = Solarsystem.all
  end

  def show
    @selected_planet = Planet.find params[:id]
    #@solar_system = Solarsystem.find(@selected_planet)
    @range = Planet.find(@actual_user.planet_id).distanceto(@selected_planet)
    @buildings = Building.all
  end

  def buyBuilding
    @selected_planet = Planet.find params[:planet]
    @building = Building.find params[:building]
    buyMethod = params[:buy_method].to_i
    @selected_planet.construct(@building, buyMethod)
    redirect_to :back
  end

  def attack
    @selected_planet = Planet.find params[:planet]

    @suitable_spaceships_by_planet = Hash.new

    @actual_user.planets.each do |p|
      sdistance, udistance = p.distanceto(@selected_planet)
      energy_needed = sdistance*10 + udistance*100
      suitable_spaceships = Array.new
      p.spaceships.each do |sp|
        if sp.energyTank >= energy_needed then
          suitable_spaceships << sp
        end
      end
      unless suitable_spaceships.empty? then
        @suitable_spaceships_by_planet[p] = suitable_spaceships
      end
    end
  end

  def conquer
    attackedPlanet = Planet.find params[:attacked_planet_id]
    attackingPlanet = Planet.find params[:attacking_planet_id]
    flotte = []
    params[:selected_spaceships].each do |sid|
      flotte << Spaceship.find(sid)
    end


    defenseActivePower = 0
    defensePassivePower = 0
    attackedPlanet.defenses.each do |d|
      if(d.isactive) then
        defenseActivePower += d.points
      else
        defensePassivePower += d.points
      end
      defensePower += d.points
    end

    attackPower = 0
    flotte.each do |s|
      attackPower += s.attackPoints
    end

    if attackedPlanet.user.nil? then
      attackedPlanet.conquer(@actual_user)
    else
      attackPower -= defenseActivePower

      defensePassivePower = attackedPlanet.user.energy * defensePassivePower /10


      if attackPower > defensePassivePower then
        unless attackedPlanet.id == attackedPlanet.user.planet_id
          attackedPlanet.conquer(@actual_user)
        end
        attackedPlanet.buildings = []
      else
        flotte.each do |d|
          attackingPlanet.spaceships.delete(d)
        end
      end

      attackedPlanet.user.energy -= attackPower


      attackedPlanet.user.save

    end
    attackedPlanet.save
    attackingPlanet.save

    redirect_to url_for controller: :planet, action: :show, id: params[:attacked_planet_id]
  end



end
