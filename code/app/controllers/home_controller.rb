class HomeController < ApplicationController
  skip_before_action :authorize

  def index
      @variable = 4
  end

  def home
  end
end
