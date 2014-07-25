FactoryGirl.define do
  factory :master_class do
    sequence(:name) {|n| "master class #{n}"}
    sequence(:text) {|n| "<p>master class #{n} text</p>"}
  end
end
