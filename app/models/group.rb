class Group < ActiveRecord::Base
  include IsAsset, HasAttachedPicture

  belongs_to :larp
  has_many :memberships, dependent: :destroy
  accepts_nested_attributes_for :memberships, allow_destroy: true, reject_if: proc { |attributes| attributes['target_id'].blank? }
end
