class AddBirdWatchingToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :bird_watching, :boolean
  end
end
