class AddTargetCustomPictureToRelationships < ActiveRecord::Migration
  def self.up
    change_table :relationships do |t|
      t.attachment :attached_picture
    end
  end

  def self.down
    drop_attached_file :relationships, :attached_picture
  end
end
