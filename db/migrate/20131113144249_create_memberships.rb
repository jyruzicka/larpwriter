class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :group, index: true
      t.string :target_custom_name
      t.text :target_description
      t.references :target, index: true, polymorphic: true
      t.references :larp, index: true
      t.integer :rank

      t.timestamps
    end
  end
end
