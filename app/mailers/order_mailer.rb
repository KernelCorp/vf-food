class OrderMailer < ActionMailer::Base
  default to: 'vfcatering@mail.ru'

  def inform_new_order(order)
    @order = order
    mail subject: 'Vf-food.com - новый заказ'
  end
end
