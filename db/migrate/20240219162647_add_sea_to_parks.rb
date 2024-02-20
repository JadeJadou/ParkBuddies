class AddSeaToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :sea, :boolean
  end
end
