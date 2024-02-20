class AddTennisToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :tennis, :boolean
  end
end
