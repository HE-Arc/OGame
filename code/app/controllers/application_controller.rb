class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize, :get_user

  protected
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice:"NOPE !!!"
    end
  end

  def get_user
    @actual_user = User.find(session[:user_id]) unless session[:user_id].blank?
  end
end
