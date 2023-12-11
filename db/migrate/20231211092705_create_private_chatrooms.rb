class CreatePrivateChatrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :private_chatrooms do |t|
      t.string :name

      t.timestamps
    end
  end
end
