class DestroyPrivateChats < ActiveRecord::Migration[7.1]
  def change
    drop_table :private_chats, if_exists: true
  end
end
