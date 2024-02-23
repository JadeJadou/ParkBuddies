class AddDogsToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :dogs, :boolean
  end
end
