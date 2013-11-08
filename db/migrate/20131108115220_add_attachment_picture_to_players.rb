class AddAttachmentPictureToPlayers < ActiveRecord::Migration
  def self.up
    change_table :players do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :players, :picture
  end
end
