class Pc < ActiveRecord::Base
  belongs_to :larp
  belongs_to :player

  validates_presence_of :name
  validates_uniqueness_of :name, scope: :larp_id

  scope :by_name, -> { order :name }

  delegate :picture, to: :player, prefix: true, allow_nil: true
  delegate :name,    to: :player, prefix: true, allow_nil: true
end
