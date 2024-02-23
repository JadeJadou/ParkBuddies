class AddOsmIdToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :osm_id, :string
  end
end
