class AddPicnicToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :picnic, :boolean
  end
end
