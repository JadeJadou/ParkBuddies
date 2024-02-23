class AddHikingToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :hiking, :boolean
  end
end
