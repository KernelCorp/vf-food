# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    name "some order"
    phone "123-123-22"
    email "order@mail.ru"
    from "index"
    text "some text for order"
  end
end
