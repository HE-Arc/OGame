class SessionsController < ApplicationController
  skip_before_action :authorize, :checklabo?, :checkspatioport?, :checkministere?
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      redirect_to login_url, alert:"Invalid Username or Password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, alert:"Logout success"
  end
end
