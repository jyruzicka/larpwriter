class AddMembershipsCountToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :memberships_count, :integer, default: 0, null: false
  end
end
