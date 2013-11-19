class Membership < ActiveRecord::Base
  include HasAttachedPicture, IsSortable

  ranks :rank, with_same: :group_id

  belongs_to :group, counter_cache: true
  belongs_to :target, polymorphic: true

  before_create :set_larp_id

  def picture
    if attached_picture.exists?
      attached_picture
    else
      target.picture
    end
  end

  def target_name
    target_custom_name.presence || target.name
  end

  private

  def set_larp_id
    self.larp_id = target.larp_id
  end
end
