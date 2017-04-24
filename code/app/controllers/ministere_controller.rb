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

    # XXX Problème Read-Write
    # - vous lisez la valeur
    # - puis la modifiez en fonction d'un test.
    # - même au sein d'une transaction, ce n'est pas atomique.
    # - il faut donc utiliser SELECT FOR UPDATE ~> with_lock
    @actual_user.with_lock do
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
    end
    redirect_to :back
  end

end
