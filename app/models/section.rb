class Section
  include Mongoid::Document

  field :name, type: String
  field :text, type: String

  embedded_in :menu

end
