class CateringsController < ApplicationController

  def index
    @catering = Catering.order_by(:position.asc).first
    redirect_to @catering unless @catering.nil?
  end

  def show
    @catering = Catering.find params[:id]
    @caterings = Catering.order_by(:position.asc).all
  end

end
