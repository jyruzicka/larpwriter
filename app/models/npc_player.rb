class NpcPlayer < ActiveRecord::Base
  include IsAsset, HasFirstNameAndLastName, IsPlayerOrNpcPlayer, HasAttachedPicture

  has_many :npcs, dependent: :nullify

  def pcs_or_npcs
    npcs
  end
end
