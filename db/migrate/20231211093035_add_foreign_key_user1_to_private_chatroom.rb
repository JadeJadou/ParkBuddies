class AddForeignKeyUser1ToPrivateChatroom < ActiveRecord::Migration[7.1]
  def change
    add_reference :private_chatrooms, :user_1, foreign_key: { to_table: :users }
    add_reference :private_chatrooms, :user_2, foreign_key: { to_table: :users }
  end
end
