class Relationship < ActiveRecord::Base
  include HasAttachedPicture

  belongs_to :origin, polymorphic: true
  belongs_to :target, polymorphic: true

  before_create :set_larp_id

  # unfortunatelty must be commented
  # see https://github.com/rails/rails/issues/1629#issuecomment-16418737
  #validates_presence_of :origin_id, :origin_type
  validates_presence_of :target_id, :target_type

  # returns relationships for which the reverse relationship (target -> origin)
  # does not exist
  # for instance if we have the relationships (1,2), (2,1), (1,3), (1,4)
  # then it would return the relationships (1,3), (1,4)
  # because the relationships (3,1), (4,1) do not exist
  def self.without_reverse
    joins(<<-JOIN
            LEFT JOIN relationships r2
              ON  r2.origin_id   = relationships.target_id
              AND r2.origin_type = relationships.target_type
              AND r2.target_id   = relationships.origin_id
              AND r2.target_type = relationships.origin_type
          JOIN
          )
    .where("r2.origin_id IS NULL")
  end

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

  private

  def set_larp_id
    self.larp_id = target.larp_id
  end
end
