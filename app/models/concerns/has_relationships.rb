module HasRelationships
  extend ActiveSupport::Concern

  included do
    has_many :as_origin_relationships, class_name: "Relationship", dependent: :destroy, as: :origin
    accepts_nested_attributes_for :as_origin_relationships, allow_destroy: true, reject_if: proc { |attributes| attributes['target_id'].blank? }
    has_many :as_target_relationships, class_name: "Relationship", dependent: :destroy, as: :target
  end
end
