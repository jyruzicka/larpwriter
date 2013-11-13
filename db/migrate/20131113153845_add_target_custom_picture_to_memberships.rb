class AddTargetCustomPictureToMemberships < ActiveRecord::Migration
  def self.up
    change_table :memberships do |t|
      t.attachment :attached_picture
    end
  end

  def self.down
    drop_attached_file :memberships, :attached_picture
  end
end
