class OrderMailer < ActionMailer::Base
  # default from: 'user@example.com'

  def inform_new_order
    mail to: 'u@mail.com', subject: 'Vf-food.com - новый заказ на сайте'
  end
end
