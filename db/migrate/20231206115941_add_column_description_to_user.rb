class AddColumnDescriptionToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :description, :text
  end
end
