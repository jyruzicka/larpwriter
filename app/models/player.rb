class Player < ActiveRecord::Base
  include HasFirstNameAndLastName

  belongs_to :larp

  validates_presence_of :first_name, :larp_id, :email
  validates_format_of   :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  attr_accessor :birth_date_as_string

  has_attached_file :picture, styles: { medium: "124x160", thumbnail: "25x32" }
  validates_attachment_content_type :picture,
    content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/,
    message:      'file type is not allowed (only jpeg/png/gif images)'
  attr_accessor :remove_picture
  before_save { |player| player.picture = nil if remove_picture }

  def age
    "todo"
    #now = Time.now.utc.to_date
    #now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)
  end
end
