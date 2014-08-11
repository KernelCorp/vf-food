class OrderMailer < ActionMailer::Base
  # default from: 'user@example.com'

  def inform_new_order
    mail to: 'vfcatering@mail.ru', subject: 'Vf-food.com - новый заказ на сайте'
  end
end
