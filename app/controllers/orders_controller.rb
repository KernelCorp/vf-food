class OrdersController < ApplicationController
  respond_to :json
  inherit_resources
  actions :create

  private
  def order_params
    params.require(:order).permit :name, :phone, :email, :text, :from
  end

end
