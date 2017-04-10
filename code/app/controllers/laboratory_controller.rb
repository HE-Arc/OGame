class LaboratoryController < ApplicationController
  before_action :authorize, :get_user, :checklabo, :checkspatioport
  
  def index
    if @hasLabo then
      redirect_to user_path(@actual_user)
    end
  end

  def buy
    tech = Technology.find params[:tech_id].to_i
    buyMethod = params[:buy_method].to_i
    if buyMethod == 0 then
      if @actual_user.energy >= tech.costEnergy then
        @actual_user.technologies.push(tech)
        @actual_user.energy -= tech.costEnergy
      end
    else
      if @actual_user.money >= tech.costMoney then
        @actual_user.technologies.push(tech)
        @actual_user.money -= tech.costMoney
      end
    end
    @actual_user.save
    redirect_to :back
  end

end
