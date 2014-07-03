class AboutController < ApplicationController

  def index

  end

  def show

  end

  private

  def about_params
    params.require(:about).permit(seo_attributes: [:title, :description, :keywords])
  end

end
