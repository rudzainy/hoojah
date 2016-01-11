class AddDisableToOpinion < ActiveRecord::Migration
  def change
  	add_column :opinions, :disable, :boolean, default: false
  end
end
