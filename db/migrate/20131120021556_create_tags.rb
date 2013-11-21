class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.text :description
      t.references :larp, index: true
      t.string :color
      t.integer :taggings_count, default: 0, null: false

      t.timestamps
    end
  end
end
