class AddForestToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :forest, :boolean
  end
end
