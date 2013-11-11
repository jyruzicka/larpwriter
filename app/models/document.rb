class Document < ActiveRecord::Base
  belongs_to :larp

  validates_presence_of :name

  scope :by_name, -> { order :name }

  normalize_attributes :name

  has_attached_file :file
  validates_attachment_size :file, less_than: 20.megabytes, message: "must be less than 20 MB"
  attr_accessor :remove_file
  before_save { |document| document.file = nil if remove_file }
end
