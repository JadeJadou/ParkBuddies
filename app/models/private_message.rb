class PrivateMessage < ApplicationRecord

  belongs_to :private_chatroom
  belongs_to :user

  def sender?(a_user)
    user.id == a_user.id
  end

  # after_create_commit -> {
  #    broadcast_append_to( "notification", partial: "private_messages/private_message_notif", locals: { private_message: self }, target: "notification_#{ self.private_message.user == self.private_message.private_chatroom.user_1 ? self.private_message.private_chatroom.user_2 : self.private_message.private_chatroom.user_1}")
  #   }
    after_create_commit -> {
      puts "test"
      recipient_user = self.private_chatroom.user_1 == self.user ? self.private_chatroom.user_2 : self.private_chatroom.user_1
      broadcast_append_to("notification", partial: "private_messages/private_message_notif", locals: { private_message: self }, target: "notification_#{recipient_user.id}")
    }
end
