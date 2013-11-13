class Relationship < ActiveRecord::Base
  include HasAttachedPicture

  belongs_to :origin, polymorphic: true
  belongs_to :target, polymorphic: true

  # unfortunatelty must be commented
  # see https://github.com/rails/rails/issues/1629#issuecomment-16418737
  #validates_presence_of :origin_id, :origin_type
  validates_presence_of :target_id, :target_type

  def reverse_relationship
    Relationship.where({
      origin_id:   target_id,
      origin_type: target_type,
      target_id:   origin_id,
      target_type: origin_type,
    }).first
  end

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
