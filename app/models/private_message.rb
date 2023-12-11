class PrivateMessage < ApplicationRecord
  belongs_to :private_chatroom
  belongs_to :user

  def sender?(a_user)
    user.id == a_user.id
  end
end
