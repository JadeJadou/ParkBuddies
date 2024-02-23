class AddMountainToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :mountain, :boolean
  end
end
