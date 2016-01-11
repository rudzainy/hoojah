 class CreateDebates < ActiveRecord::Migration
  def change
    create_table :debates do |t|
      t.integer :opinion_id
      t.integer :user_pro_id
      t.integer :user_con_id
      t.datetime :deadline
      t.integer :winner_id
      t.boolean :disable, default: false

      t.timestamps null: false
    end
  end
end
