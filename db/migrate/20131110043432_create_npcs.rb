class CreateNpcs < ActiveRecord::Migration
  def change
    create_table :npcs do |t|
      t.string :name, null: false
      t.text :description
      t.references :larp, index: true
      t.references :npc_player, index: true

      t.timestamps
    end
  end
end
