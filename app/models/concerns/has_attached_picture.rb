module HasAttachedPicture
  extend ActiveSupport::Concern

  included do
    has_attached_file :attached_picture, styles: { medium: "124x160", thumbnail: "25x32" }
    validates_attachment_size :attached_picture, less_than: 5.megabytes, message: "must be less than 5 MB"
    validates_attachment_content_type :attached_picture,
      content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/,
      message:      'file type is not allowed (only jpeg/png/gif images)'
    attr_accessor :remove_attached_picture
    before_save { |asset| asset.attached_picture = nil if remove_attached_picture }
  end
end
