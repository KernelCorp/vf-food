class Client
  include Mongoid::Document
  include Mongoid::Paperclip
  include ActsAsPage

  field :name, type: String
  field :link, type: String

  has_mongoid_attached_file :attachment,
                            # :processors => [:thumbnail],
                            styles: {
                                normal: {
                                    geometry: '200x200#'
                                },
                                thumb: {
                                    geometry: '50x50'
                                }
                            },
                            convert_options:{
                                normal: '-quality 100 -strip',
                                thumb: '-quality 100 -strip'
                            },
                            path: ':rails_root/public/system/images/clients/:style/:filename',
                            url: '/system/images/clients/:style/:filename'

  validates_attachment_content_type :attachment, content_type: %w(image/jpg image/jpeg image/png)
end
