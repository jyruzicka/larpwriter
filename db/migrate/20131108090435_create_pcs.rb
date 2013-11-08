class CreatePcs < ActiveRecord::Migration
  def change
    create_table :pcs do |t|
      t.string :name, null: false
      t.text :description
      t.references :larp, index: true

      t.timestamps
    end
  end
end
