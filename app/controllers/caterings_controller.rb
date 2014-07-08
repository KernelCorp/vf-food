class CateringsController < ApplicationController

  def index
    @caterings = Catering.all
  end

  def show
    @catering = Catering.find params[:id]
  end

end
