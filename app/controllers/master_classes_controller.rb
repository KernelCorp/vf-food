class MasterClassesController < ApplicationController

  def index
    @master_classes = MasterClass.all
  end

  def show
    @master_class = MasterClass.find params[:id]
  end

end
