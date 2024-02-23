class AddBenchesToParks < ActiveRecord::Migration[7.1]
  def change
    add_column :parks, :benches, :boolean
  end
end
