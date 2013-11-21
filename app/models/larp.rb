class Larp < ActiveRecord::Base
  include HasName

  PLURAL_ASSET_TYPES = %i(groups pcs players npcs npc_players documents organizers)

  has_many :tags
  has_many :groups,      dependent: :destroy
  has_many :pcs,         dependent: :destroy
  has_many :npcs,        dependent: :destroy
  has_many :players,     dependent: :destroy
  has_many :npc_players, dependent: :destroy
  has_many :organizers,  dependent: :destroy
  has_many :documents,   dependent: :destroy

  has_many :relationships
  has_many :memberships
end
