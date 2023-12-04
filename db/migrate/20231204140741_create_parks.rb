class CreateParks < ActiveRecord::Migration[7.1]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :address
      t.text :description
      t.string :category
      t.boolean :sandbox
      t.boolean :slide
      t.boolean :sling
      t.boolean :water
      t.boolean :climber
      t.boolean :coffee
      t.boolean :zoo
      t.boolean :toys_rent
      t.integer :suitable_from_age

      t.timestamps
    end
  end
end
