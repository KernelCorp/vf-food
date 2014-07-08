class Dish
  include Mongoid::Document

  field :name
  field :description
  field :cost

  embedded_in :catering
end
