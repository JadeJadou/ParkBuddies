class AddSkateboardToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :skateboard, :boolean
  end
end
