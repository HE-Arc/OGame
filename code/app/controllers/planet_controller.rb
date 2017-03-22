class PlanetController < ApplicationController
  def index
    @planets = Planet.all
  end

  def show
    @selected_planet = Planet.find params[:id]
    @solar_system = Solarsystem.find(@selected_planet)
    @range = Math.sqrt((Planet.find(@actual_user.planet_id).position_x-@selected_planet.position_x)**2 +
                       (Planet.find(@actual_user.planet_id).position_y-@selected_planet.position_y)**2 +
                       (Planet.find(@actual_user.planet_id).position_z-@selected_planet.position_z)**2)
  end
end
