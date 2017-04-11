class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize, :get_user, :checklabo?, :checkspatioport?, :checkministere?

  protected
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice:"NOPE !!!"
    end
  end

  def get_user
    @actual_user = User.find(session[:user_id]) unless session[:user_id].blank?
  end

  def checklabo?
    @hasLabo = false
    @actual_user.planets.each do |p|
      if p.buildings.where(name: "Laboratoire de Dexter").take then
        @hasLabo = true
      end
    end
  end

  def checkspatioport?
    @hasSpatio = false
    @actual_user.planets.each do |p|
      if p.buildings.where(name: "Spatioporc").take then
        @hasSpatio = true
      end
    end
  end

  def checkministere?
    @hasMinistere = false
    @actual_user.planets.each do |p|
      if p.buildings.where(name: "Ministère de la défense").take then
        @hasMinistere = true
      end
    end
  end

end
