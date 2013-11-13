class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.references :larp, index: true

      t.timestamps
    end
  end
end
