class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name, null: :false
      t.text :content
      t.references :larp, index: true
      t.boolean :is_included_in_all_pcs
      t.boolean :is_included_in_all_npcs

      t.timestamps
    end
  end
end
