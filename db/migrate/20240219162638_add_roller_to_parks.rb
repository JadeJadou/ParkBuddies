class AddRollerToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :roller, :boolean
  end
end
