class OrdersController < InheritedResources::Base
  respond_to :json

  def create
    @order = Order.new order_params
    if @order.save
      OrderMailer.inform_new_order(@order).deliver
      render json: @order
    else
      render json: {errors: @order.errors.messages}, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order).permit :name, :phone, :email, :text, :from
  end

end
