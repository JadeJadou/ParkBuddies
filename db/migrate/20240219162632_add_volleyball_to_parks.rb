class AddVolleyballToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :volleyball, :boolean
  end
end
