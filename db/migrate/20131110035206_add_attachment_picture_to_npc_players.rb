class AddAttachmentPictureToNpcPlayers < ActiveRecord::Migration
  def self.up
    change_table :npc_players do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :npc_players, :picture
  end
end
