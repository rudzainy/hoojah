class CreateHoojahs < ActiveRecord::Migration
  def change
    create_table :hoojahs do |t|
      t.integer :debate_id
      t.text :body
      t.boolean :disable, default: false

      t.timestamps null: false
    end
  end
end
