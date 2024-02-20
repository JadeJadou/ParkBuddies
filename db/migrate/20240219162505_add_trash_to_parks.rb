class AddTrashToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :trash, :boolean
  end
end
