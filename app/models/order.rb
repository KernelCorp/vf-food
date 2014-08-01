class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :phone, type: String
  field :email, type: String
  field :from, type: String
  field :text, type: String

  validates :name, presence: true, length: {minimum: 2, maximum: 120}
  validates :phone, presence: true, length: {minimum: 5, maximum: 22},
            format: {with: /\A\+?\d+?-?(\(\d+\)-?)?(\d+-)*\d+\z/i}
  validates :email, presence: true, length: {minimum: 2, maximum: 120},
            format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)[a-z]{2,})\z/i}
end
