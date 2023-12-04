class AddKidsCountColumnToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :kids_count, :integer
  end
end
