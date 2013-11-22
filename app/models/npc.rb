class Npc < ActiveRecord::Base
  include IsAsset, IsPcOrNpc, HasAttachedPicture, IsTaggable, HasDocuments

  belongs_to :npc_player

  def player_or_npc_player
    npc_player
  end
end
