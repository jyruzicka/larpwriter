class CreateOrganizers < ActiveRecord::Migration
  def change
    create_table :organizers do |t|
      t.references :larp, index: true
      t.references :user, index: true
      t.string :first_name, null: false
      t.string :last_name
      t.string :email, null: false

      t.timestamps
    end
  end
end
