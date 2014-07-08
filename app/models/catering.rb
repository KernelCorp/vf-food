class Catering
  include Mongoid::Document
  include ActsAsPage

  embeds_many :dishes
  accepts_nested_attributes_for :dishes

  embeds_many :images, as: :galleryimages, class_name: 'GalleriesImage'
  accepts_nested_attributes_for :images
end
