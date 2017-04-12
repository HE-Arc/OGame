class MinistereController < ApplicationController
  def index
  end

  def show
    @selected_planet = Planet.find params[:id]
    @def = @selected_planet.defenses
    if @selected_planet.user.nil? || @selected_planet.user != @actual_user then
      redirect_to action: "index"
    end
  end

  def buy
    defense = Defense.find params[:defense_id].to_i
    buyMethod = params[:buy_method].to_i
    selected_planet = Planet.find params[:planet_id]
    if buyMethod == 0 && selected_planet.buildings.count < selected_planet.getCaseprise then
      if @actual_user.metal >= defense.costMetal then
        selected_planet.defenses.push(defense)
        @actual_user.metal -= defense.costMetal
      end
    else
      if @actual_user.money >= defense.costMoney then
        selected_planet.defenses.push(defense)
        @actual_user.money -= defense.costMoney
      end
    end
    @actual_user.save
    redirect_to :back
  end

end
