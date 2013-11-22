class AssetDocument < ActiveRecord::Base
  belongs_to :documentable, polymorphic: true
  belongs_to :document

  validates_uniqueness_of :document_id, scope: [:documentable_id, :documentable_type]
end
