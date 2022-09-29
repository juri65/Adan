class AddGroupIdToNotification < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :group_id, :integer
  end
end
