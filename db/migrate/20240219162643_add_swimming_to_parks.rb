class AddSwimmingToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :swimming, :boolean
  end
end
