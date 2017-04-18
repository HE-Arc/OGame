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
    @selected_planet.construct(@building)
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
end
