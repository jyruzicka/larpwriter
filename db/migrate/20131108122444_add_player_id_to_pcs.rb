class AddPlayerIdToPcs < ActiveRecord::Migration
  def change
    add_reference :pcs, :player, index: true
  end
end
