class AddUserIdToHoojahs < ActiveRecord::Migration
  def change
    add_column :hoojahs, :user_id, :integer
  end
end
