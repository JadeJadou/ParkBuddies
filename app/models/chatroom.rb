class Chatroom < ApplicationRecord
  belongs_to :park
  has_many :messages
  has_many :users, through: :messages
end
