class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.references :opinion
      t.references :user
      t.integer :user_vote, default:0
      t.boolean :disable, default: false

      t.timestamps null: false
    end
      add_index :comments, :user_id
  end
end
