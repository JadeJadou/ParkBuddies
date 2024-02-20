class AddBasketballToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :basketball, :boolean
  end
end
