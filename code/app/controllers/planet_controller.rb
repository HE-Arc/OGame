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
      if d.isactive then
        if d.name == "Lance-fourchette" && (attackingPlanet.user.technologies.include? Technology.where(name: "Fourchette à 5 dents").take) then
            defenseActivePower += d.points*2
        elsif d.name == "Canon à poulet ioniques"  && (attackingPlanet.user.technologies.include? Technology.where(name: "Modification génétique des poulets").take) then
            defenseActivePower += d.points*3
        elsif d.name == "Lance-boulanger"  && (attackingPlanet.user.technologies.include? Technology.where(name: "Chirurgie esthétique").take) then
            defenseActivePower += d.points*4
        else
            defenseActivePower += d.points
        end
      else
        if d.name == "Bouclier en bois" && (attackingPlanet.user.technologies.include? Technology.where(name: "Peinture rose").take) then
          defensePassivePower += d.points*2
        elsif d.name == "Bouclier ionique bovin"  && (attackingPlanet.user.technologies.include? Technology.where(name: "Aspirateur à méthane").take) then
          defensePassivePower += d.points*3
        elsif d.name == "Machine à café plasma"  && (attackingPlanet.user.technologies.include? Technology.where(name: "Grains de Kopi Luwak").take) then
          defensePassivePower += d.points*4
        else
          defensePassivePower += d.points
        end
      end
    end

    attackPower = 0
    flotte.each do |s|
      if s.name == "Boîte en carton" && (attackingPlanet.user.technologies.include? Technology.where(name: "Papier cadeau").take) then
        attackPower += s.attackPoints*2
      elsif s.name == "Gyropode volant"  && (attackingPlanet.user.technologies.include? Technology.where(name: "Porte-bagages atomique").take) then
        attackPower += s.attackPoints*3
      elsif s.name == "DeLorean d'occasion"  && (attackingPlanet.user.technologies.include? Technology.where(name: "Kit carosserie").take) then
        attackPower += s.attackPoints*4
      else
        attackPower += s.attackPoints
      end
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
