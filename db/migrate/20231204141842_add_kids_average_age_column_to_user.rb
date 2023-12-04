class AddKidsAverageAgeColumnToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :kids_average_age, :integer
  end
end
