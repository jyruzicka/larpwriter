class AddAttachmentPictureToPlayers < ActiveRecord::Migration
  def self.up
    change_table :players do |t|
      t.attachment :attached_picture
    end
  end

  def self.down
    drop_attached_file :players, :attached_picture
  end
end
