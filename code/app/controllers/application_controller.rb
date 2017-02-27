class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
<<<<<<< HEAD
  
=======
  before_action :authorize
  protected
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice:"NOPE !!!"
    end
  end
>>>>>>> fd286674c4f0d5367b1ccb2ef8ab1e4281a2daad
end
