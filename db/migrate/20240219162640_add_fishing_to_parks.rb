class AddFishingToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :fishing, :boolean
  end
end
