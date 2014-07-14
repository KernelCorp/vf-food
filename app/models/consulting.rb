class Consulting
  include Mongoid::Document
  include ActsAsPage

  embeds_many :images, as: :galleryimages, class_name: 'GalleriesImage'
end
