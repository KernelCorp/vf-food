class Catering
  include Mongoid::Document
  include Mongoid::Paperclip
  include ActsAsPage

  embeds_one :menu, class_name: 'Menu'
  accepts_nested_attributes_for :menu

  embeds_many :images, as: :galleryimages, class_name: 'GalleriesImage'
  accepts_nested_attributes_for :images

  has_mongoid_attached_file :attachment,
      # :processors => [:thumbnail],
      styles: {
          thumb: {
              geometry: '400x200',
              # watermark_path: "#{Rails.root}/public/images/watermark.png",
              # position: 'SouthWest'
          }
      },
      convert_options:{
          thumb: '-quality 100 -strip',
          original: '-quality 100 -strip'
      },
      path: ':rails_root/public/system/images/:class/:id_partition/:style/:filename',
      url: '/system/images/:class/:id_partition/:style/:filename'

  validates_attachment_content_type :attachment, content_type: %w(image/jpg image/jpeg image/png)

  after_initialize {build_menu if menu.nil?}
end
