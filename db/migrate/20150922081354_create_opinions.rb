class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.string :image
      t.string :option1
      t.string :option2

      t.timestamps null: false
    end
  end
end
