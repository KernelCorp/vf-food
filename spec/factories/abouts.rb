FactoryGirl.define do
  factory :about do
    sequence(:name) {|n| "about #{n}"}
    sequence(:text) {|n| "about text #{n}"}
  end
end
