class AddAttachmentPictureToGroups < ActiveRecord::Migration
  def self.up
    change_table :groups do |t|
      t.attachment :attached_picture
    end
  end

  def self.down
    drop_attached_file :groups, :attached_picture
  end
end
