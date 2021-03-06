class Menu
  include Mongoid::Document

  field :name, type: String
  field :description, type: String
  field :price, type: String

  embeds_many :sections
  accepts_nested_attributes_for :sections, allow_destroy: true

  embedded_in :catering

end
