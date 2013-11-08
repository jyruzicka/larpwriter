class AddSiteAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :site_admin, :boolean, default: false, null: :false
  end
end
