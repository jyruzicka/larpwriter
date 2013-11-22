class Document < ActiveRecord::Base
  include IsAsset, IsTaggable

  has_many :asset_documents, dependent: :destroy
  accepts_nested_attributes_for :asset_documents, allow_destroy: true, reject_if: proc { |attributes| attributes['documentable_id'].blank? }

  has_attached_file :file
  validates_attachment_size :file, less_than: 20.megabytes, message: "must be less than 20 MB"
  attr_accessor :remove_file
  before_save { |document| document.file = nil if remove_file }

end
