class Project
  include Mongoid::Document
  include ActsAsPage

  embeds_many :galleries_images, as: :images
end
