class AddBadmintonToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :badminton, :boolean
  end
end
