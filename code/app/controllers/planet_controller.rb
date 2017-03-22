class PlanetController < ApplicationController
  def index
    @planets = Planet.all
  end

  def show
    @selected_planet = Planet.find params[:id]
  end
end
