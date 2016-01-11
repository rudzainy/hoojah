class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :opinion_id
      t.integer :user_id
      t.integer :flag

      t.timestamps null: false
    end
  end
end
