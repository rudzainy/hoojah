class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
    	t.integer :user_id
    	t.integer :sender_id
      t.integer :debate_id
    	t.timestamps null: false
    end
  end
end
