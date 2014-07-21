# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :about do
    sequence(:name) {|n| "about #{n}"}
  end
end
