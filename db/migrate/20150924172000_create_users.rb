class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.integer :role_id
      t.string :name
      t.text :about
      t.string :avatar
      t.string :location
      t.integer :gender
      t.date :birthday
      t.integer :vote_count
      t.integer :opinion_count
      t.integer :debate_count
      t.integer :karma
      t.boolean :disable

      t.timestamps null: false
    end
  end
end
