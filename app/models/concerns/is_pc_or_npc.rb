module IsPcOrNpc
  extend ActiveSupport::Concern

  included do
    validates_presence_of :name
    validates_uniqueness_of :name, scope: :larp_id

    scope :by_name, -> { order :name }

    delegate :picture, to: :player_or_npc_player, prefix: true, allow_nil: true
    delegate :name,    to: :player_or_npc_player, prefix: true, allow_nil: true

    normalize_attributes :name
  end
end
