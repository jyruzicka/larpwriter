class Group < ActiveRecord::Base
  include IsAsset, HasAttachedPicture, HasRelationships

  has_many :memberships, dependent: :destroy
  accepts_nested_attributes_for :memberships, allow_destroy: true, reject_if: proc { |attributes| attributes['target_id'].blank? }

  # group can be a target in a relationship
  # and target in relationship must respond to `picture`
  def picture
    attached_picture
  end
end
