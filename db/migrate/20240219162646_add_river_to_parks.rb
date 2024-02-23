class AddRiverToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :river, :boolean
  end
end
