class GalleriesImage
  include Mongoid::Document
  include Mongoid::Paperclip

  has_mongoid_attached_file :attachment

  embedded_in :images, polymorphic: true

  validates_attachment_content_type :attachment, content_type: %w(image/jpg image/jpeg image/png)
end
