FactoryGirl.define do
  factory :catering do
    sequence(:name) {|n| "catering #{n}"}
  end
end
