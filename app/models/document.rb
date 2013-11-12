class Document < ActiveRecord::Base
  include IsAsset

  has_attached_file :file
  validates_attachment_size :file, less_than: 20.megabytes, message: "must be less than 20 MB"
  attr_accessor :remove_file
  before_save { |document| document.file = nil if remove_file }
end
