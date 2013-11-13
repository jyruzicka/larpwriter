class Membership < ActiveRecord::Base
  include HasAttachedPicture

  belongs_to :group, counter_cache: true
  belongs_to :target, polymorphic: true

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
end
