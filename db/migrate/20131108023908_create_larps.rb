class CreateLarps < ActiveRecord::Migration
  def change
    create_table :larps do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
