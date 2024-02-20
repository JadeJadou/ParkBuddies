class AddBarbecueToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :barbecue, :boolean
  end
end
