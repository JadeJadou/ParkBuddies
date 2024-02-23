class AddCyclingToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :cycling, :boolean
  end
end
