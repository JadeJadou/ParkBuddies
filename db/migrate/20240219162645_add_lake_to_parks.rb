class AddLakeToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :lake, :boolean
  end
end
