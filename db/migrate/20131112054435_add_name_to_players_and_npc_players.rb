class AddNameToPlayersAndNpcPlayers < ActiveRecord::Migration
  def change
    add_column :npc_players, :name, :string, null: false
    add_column :players, :name, :string, null: false
    add_column :organizers, :name, :string, null: false
  end
end
