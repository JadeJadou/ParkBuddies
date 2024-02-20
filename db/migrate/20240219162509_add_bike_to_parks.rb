class AddBikeToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :bike, :boolean
  end
end
