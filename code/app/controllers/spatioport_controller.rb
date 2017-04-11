class SpatioportController < ApplicationController
  def index
  end

  def show
    @selected_planet = Planet.find params[:id]
    @spaceship = @selected_planet.spaceships
    if @selected_planet.user.nil? || @selected_planet.user != @actual_user then
      redirect_to action: "index"
    end
  end

  def buy
    spaceship = Spaceship.find params[:spaceship_id].to_i
    buyMethod = params[:buy_method].to_i
    selectedplanet = Planet.find params[:planet_id]
    if buyMethod == 0 then
      if @actual_user.metal >= spaceship.costMetal then
        selectedplanet.spaceships.push(spaceship)
        @actual_user.metal -= spaceship.costMetal
      end
    else
      if @actual_user.money >= spaceship.costMoney then
        selectedplanet.spaceships.push(spaceship)
        @actual_user.money -= spaceship.costMoney
      end
    end
    @actual_user.save
    redirect_to :back
  end
end
