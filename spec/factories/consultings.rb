FactoryGirl.define do
  factory :consulting do
    sequence(:name) {|n| "consulting #{n}"}
    sequence(:text) {|n| "<p>consulting text #{n}</p>"}
  end
end
