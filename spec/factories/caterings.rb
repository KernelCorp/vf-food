FactoryGirl.define do
  factory :catering do
    sequence(:name) {|n| "catering #{n}"}
    sequence(:text) {|n| "<p>catering text #{n}</p>"}
    sequence(:menu) do |n|
      menu = Menu.new(name: "menu #{n}", description: "<p>Some text #{n}</p>", price: n * 10000)
      3.times { |i| menu.sections.new name: "section #{i}",
                                      text: "<p>some section #{2*i+1} text</p>" }
      menu
    end
  end
end
