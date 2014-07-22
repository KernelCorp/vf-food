class MasterClass
  include Mongoid::Document
  include Mongoid::Paperclip
  include ActsAsPage

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
end
