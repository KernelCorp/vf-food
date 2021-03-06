class GalleriesImage
  include Mongoid::Document
  include Mongoid::Paperclip

  has_mongoid_attached_file :attachment,
      # :processors => [:thumbnail],
      styles: {
          small: {
              geometry: "300x300#",
              # watermark_path: "#{Rails.root}/public/images/watermark.png",
              position: 'SouthWest'
          },
          thumb: {
              geometry: "150x150#",
              # watermark_path: "#{Rails.root}/public/images/watermark.png",
              position: 'SouthWest'
          }
      },
      convert_options:{
          small: '-quality 100 -strip',
          thumb: '-quality 80 -strip',
          original: '-quality 100 -strip'
      },
      path: ':rails_root/public/system/images/:class/:id_partition/:style/:filename',
      url: '/system/images/:class/:id_partition/:style/:filename',
      default_url: ActionController::Base.helpers.asset_path('missing.png')

  embedded_in :galleryimages, polymorphic: true

  validates_attachment_content_type :attachment, content_type: %w(image/jpg image/jpeg image/png)
end
