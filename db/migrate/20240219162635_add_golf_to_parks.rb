class AddGolfToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :golf, :boolean
  end
end
