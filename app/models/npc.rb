class Npc < ActiveRecord::Base
  include IsPcOrNpc

  belongs_to :larp
  belongs_to :npc_player

  delegate :picture, to: :npc_player, prefix: true, allow_nil: true
  delegate :name,    to: :npc_player, prefix: true, allow_nil: true
end
