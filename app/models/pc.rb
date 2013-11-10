class Pc < ActiveRecord::Base
  include IsPcOrNpc

  belongs_to :larp
  belongs_to :player

  delegate :picture, to: :player, prefix: true, allow_nil: true
  delegate :name,    to: :player, prefix: true, allow_nil: true
end
