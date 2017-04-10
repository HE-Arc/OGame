class MinistereController < ApplicationController
  def index
  end

  def show
    @selected_planet = Planet.find params[:id]
    if @selected_planet.user.nil? || @selected_planet.user != @actual_user then
      redirect_to action: "index"
    end
  end

  def buy
  end
end
