class AddParkingToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :parking, :boolean
  end
end
