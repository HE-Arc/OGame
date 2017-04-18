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
end
