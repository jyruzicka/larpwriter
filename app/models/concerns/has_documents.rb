module HasDocuments
  extend ActiveSupport::Concern

  included do
    has_many :asset_documents, as: :documentable, dependent: :destroy
    accepts_nested_attributes_for :asset_documents, allow_destroy: true, reject_if: proc { |attributes| attributes['document_id'].blank? }
    has_many :documents, through: :asset_documents
  end
end
