class HomeController < ApplicationController

  def index
    @message = "My Home"
    render :index
  end
end
