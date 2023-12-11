class PrivateChatroom < ApplicationRecord
  has_many :private_messages, dependent: :destroy
  has_many :users

  validates :name, presence: true, uniqueness: true
  validates :user_1, presence: true
  validates :user_2, presence: true

  def other_user(current_user)
    if current_user == user_1
      user_2
    else
      user_1
    end
  end
end
