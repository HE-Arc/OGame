class PlanetController < ApplicationController
  def index
    @solarsystems = Solarsystem.all
  end

  def show
    @selected_planet = Planet.find params[:id]
    #@solar_system = Solarsystem.find(@selected_planet)
    @range = Planet.find(@actual_user.planet_id).distanceto(@selected_planet)
  end
end
