class AddFootballToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :football, :boolean
  end
end
