class MasterClassesController < ApplicationController

  def index
    @master_class = MasterClass.first
    redirect_to @master_class unless @master_class.nil?
  end

  def show
    @master_class = MasterClass.find params[:id]
    @master_classes = MasterClass.all
  end

end
