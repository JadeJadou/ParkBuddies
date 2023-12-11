class CreatePrivateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :private_messages do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :private_chatroom, null: false, foreign_key: true
      t.timestamps
    end
  end
end
