class CreateAssetDocuments < ActiveRecord::Migration
  def change
    create_table :asset_documents do |t|
      t.references :documentable, index: true, polymorphic: true
      t.references :document, index: true

      t.timestamps
    end
  end
end
