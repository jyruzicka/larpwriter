class Player < ActiveRecord::Base
  include HasFirstNameAndLastName
  include IsPlayerOrNpcPlayer

  belongs_to :larp
  has_many :pcs, dependent: :nullify

  def pcs_or_npcs
    pcs
  end

end
