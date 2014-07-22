class CateringsController < ApplicationController

  def index
    @catering = Catering.order_by(:name.asc).first
    redirect_to @catering unless @catering.nil?
  end

  def show
    @catering = Catering.find params[:id]
    @caterings = Catering.order_by(:name.asc).all
  end

end
