class AboutController < ApplicationController

  def index
    @about = About.all
  end

  private

  def about_params
    params.require(:about).permit(seo_attributes: [:title, :description, :keywords])
  end

end
