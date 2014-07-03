class OrdersController < InheritedResources::Base

  def create
    @order = Order.new order_params
    @order.save
    render json: @order
  end


  private

  def order_params
    params.require(:order).permit :name, :phone, :email, :text, :from
  end

end
