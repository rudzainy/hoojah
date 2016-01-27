class AddDescriptionToDebate < ActiveRecord::Migration
  def change
  	add_column :debates, :description, :text
  end
end
