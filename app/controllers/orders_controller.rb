class OrdersController < InheritedResources::Base
  respond_to :json
  actions :create

  private
  def order_params
    params.require(:order).permit :name, :phone, :email, :text, :from
  end

end
