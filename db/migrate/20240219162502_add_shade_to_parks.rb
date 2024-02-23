class AddShadeToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :shade, :boolean
  end
end
