class AddIndexToLinksUserId < ActiveRecord::Migration
  def change
    add_index :links, [:user_id, :created_at]
  end
end
