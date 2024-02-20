class AddHorseRidingToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :horse_riding, :boolean
  end
end
