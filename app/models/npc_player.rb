class NpcPlayer < ActiveRecord::Base
  include IsAsset, HasFirstNameAndLastName, IsPlayerOrNpcPlayer, HasAttachedPicture, IsTaggable

  has_many :npcs, dependent: :nullify

  def pcs_or_npcs
    npcs
  end
end
