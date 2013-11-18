class Larp < ActiveRecord::Base
  include HasName

  has_many :groups,      dependent: :destroy
  has_many :pcs,         dependent: :destroy
  has_many :npcs,        dependent: :destroy
  has_many :players,     dependent: :destroy
  has_many :npc_players, dependent: :destroy
  has_many :organizers,  dependent: :destroy
  has_many :documents,   dependent: :destroy

  has_many :relationships
end
