class Larp < ActiveRecord::Base
  has_many :pcs,         dependent: :destroy
  has_many :npcs,        dependent: :destroy
  has_many :players,     dependent: :destroy
  has_many :npc_players, dependent: :destroy
  has_many :organizers,  dependent: :destroy

  validates_presence_of :name

  scope :by_name, -> { order :name }

  normalize_attributes :name
end
