class Consulting
  include Mongoid::Document
  include ActsAsPage

  embeds_many :images, as: :galleryimages, class_name: 'GalleriesImage'

  def next_record
    Consulting.where(:id.gt => self.id).first
  end

end
