FactoryGirl.define do
  factory :master_class do
    sequence(:name) {|n| "master class #{n}"}
  end
end
