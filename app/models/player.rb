class Player < ActiveRecord::Base
  include IsAsset, HasFirstNameAndLastName, IsPlayerOrNpcPlayer, HasAttachedPicture, IsTaggable

  has_many :pcs, dependent: :nullify

  def pcs_or_npcs
    pcs
  end
end
