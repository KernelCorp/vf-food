class Catering
  include Mongoid::Document
  include ActsAsPage

  embeds_many :dishes
  accepts_nested_attributes_for :dishes
end
