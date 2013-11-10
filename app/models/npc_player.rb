class NpcPlayer < ActiveRecord::Base
  include HasFirstNameAndLastName
  include IsPlayerOrNpcPlayer

  belongs_to :larp
  has_many :npcs, dependent: :nullify

  def pcs_or_npcs
    npcs
  end
end
