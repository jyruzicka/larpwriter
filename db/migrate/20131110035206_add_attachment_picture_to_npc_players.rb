class AddAttachmentPictureToNpcPlayers < ActiveRecord::Migration
  def self.up
    change_table :npc_players do |t|
      t.attachment :attached_picture
    end
  end

  def self.down
    drop_attached_file :npc_players, :attached_picture
  end
end
