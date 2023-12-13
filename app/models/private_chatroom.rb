class PrivateChatroom < ApplicationRecord
  has_many :private_messages, dependent: :destroy
  belongs_to :user_1, class_name: "User"
  belongs_to :user_2, class_name: "User"

  validates :name, presence: true, uniqueness: true
  validates :user_1, presence: true
  validates :user_2, presence: true
# est-ce que cette méthode est utile ?
  def other_user(current_user)
    if current_user == user_1
      user_2
    else
      user_1
    end
  end

end
