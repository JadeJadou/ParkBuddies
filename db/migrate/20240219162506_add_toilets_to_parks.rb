class AddToiletsToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :toilets, :boolean
  end
end
