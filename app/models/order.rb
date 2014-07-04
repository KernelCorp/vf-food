class Order
  include Mongoid::Document

  field :name, type: String
  field :phone, type: String
  field :email, type: String
  field :from, type: String
  field :text, type: String

  validates :name, presence: true, length: {minimun: 2, maximum: 255}
  validates :phone, presence: true, length: {minimun: 5, maximum: 255}
  validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)[a-z]{2,})\z/i}
end
