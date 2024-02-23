class AddPingpongToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :pingpong, :boolean
  end
end
