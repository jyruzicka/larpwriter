class Npc < ActiveRecord::Base
  include IsAsset, IsPcOrNpc, HasAttachedPicture

  belongs_to :npc_player

  def player_or_npc_player
    npc_player
  end
end
