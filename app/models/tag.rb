require 'html/sanitizer'
class Tag < ActiveRecord::Base
  SANITIZER = HTML::FullSanitizer.new

  include IsAsset

  has_many :taggings, dependent: :destroy

  has_many :groups,      through: :taggings, source: :taggable, source_type: "Group"
  has_many :pcs,         through: :taggings, source: :taggable, source_type: "Pc"
  has_many :npcs,        through: :taggings, source: :taggable, source_type: "Npc"
  has_many :players,     through: :taggings, source: :taggable, source_type: "Player"
  has_many :npc_players, through: :taggings, source: :taggable, source_type: "NpcPlayer"
  has_many :organizers,  through: :taggings, source: :taggable, source_type: "Organizer"
  has_many :documents,   through: :taggings, source: :taggable, source_type: "Document"

  before_validation :set_color, on: :create, unless: :color
  before_validation :sanitize_name, if: :name_changed?

  validates_format_of :color, with: /\A#(?:[0-9a-fA-F]{3}){1,2}\z/

  private

  def sanitize_name
    self.name = SANITIZER.sanitize name
  end

  def set_color
    self.color = %w(#F09EA4 #F3ECDC #B8DC23 #C797BF #8DD4F4 #95B2DE #D5E1A0 #97CA9F #F9CD90 #FEF59E).sample
  end
end
