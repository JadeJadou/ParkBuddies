class AddCityToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :city, :string
  end
end
