class PrivateMessage < ApplicationRecord

  belongs_to :private_chatroom
  belongs_to :user

  def sender?(a_user)
    user.id == a_user.id
  end

  after_create_commit -> {
    puts "test"
     broadcast_append_to( "notification", partial: "private_messages/private_message_notif", locals: { private_message: self }, target: "notification_#{ self.private_chatroom.user_2.id }")
    }
end
