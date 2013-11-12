class AddPictureToPcsAndNpcs < ActiveRecord::Migration
  def self.up
    change_table :pcs do |t|
      t.attachment :attached_picture
    end
    change_table :npcs do |t|
      t.attachment :attached_picture
    end
  end

  def self.down
    drop_attached_file :pcs, :attached_picture
    drop_attached_file :npcs, :attached_picture
  end
end
