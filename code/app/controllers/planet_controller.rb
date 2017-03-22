class PlanetController < ApplicationController
  def index
    @solarsystems = Solarsystem.all
  end

  def show
    @selected_planet = Planet.find params[:id]
  end
end
