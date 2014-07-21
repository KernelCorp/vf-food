FactoryGirl.define do
  factory :about do
    sequence(:name) {|n| "about #{n}"}
  end
end
