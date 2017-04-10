class HomeController < ApplicationController
  skip_before_action :authorize, :checklabo, :checkspatioport, :checkministere

  def index
      @variable = 4
      unless @actual_user == nil
        redirect_to user_path(@actual_user)
      end
  end

  def home
  end
end
