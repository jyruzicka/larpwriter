module IsPcOrNpc
  extend ActiveSupport::Concern

  included do
    include HasRelationships

    has_many :memberships, as: :target
    accepts_nested_attributes_for :memberships, allow_destroy: true, reject_if: proc { |attributes| attributes['group_id'].blank? }
    has_many :groups, through: :memberships

    validates_uniqueness_of :name, scope: :larp_id

    delegate :name, to: :player_or_npc_player, prefix: :player_or_npc_player, allow_nil: true

    def group_names
      groups.pluck(:name).join ", "
    end

    def picture
      if attached_picture.exists?
        attached_picture
      elsif player_or_npc_player && player_or_npc_player.attached_picture.exists?
        player_or_npc_player.attached_picture
      else
        NullPicture
      end
    end
  end
end
