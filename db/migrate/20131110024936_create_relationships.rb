class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :origin, index: true, polymorphic: true
      t.references :target, index: true, polymorphic: true
      t.text :target_description
      t.string :target_custom_name

      t.timestamps
    end
  end
end
