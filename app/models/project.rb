class Project
  include Mongoid::Document
  include ActsAsPage

  embeds_many :images, as: :galleries_images
end
