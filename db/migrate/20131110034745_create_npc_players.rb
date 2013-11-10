class CreateNpcPlayers < ActiveRecord::Migration
  def change
    create_table :npc_players do |t|
      t.string :first_name
      t.string :last_name
      t.references :larp, index: true
      t.string :email
      t.text :notes
      t.string :phone_numbers
      t.string :postal_address
      t.date :birth_date

      t.timestamps
    end
  end
end
