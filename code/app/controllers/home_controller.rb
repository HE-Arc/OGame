class HomeController < ApplicationController
  def index

    @actual_user = User.find(session[:user_id]) unless session[:user_id].blank?
    
  end
end
