class AddRunningToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :running, :boolean
  end
end
