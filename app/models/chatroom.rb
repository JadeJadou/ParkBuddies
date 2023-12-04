class Chatroom < ApplicationRecord
  belongs_to :park
  has_many :messages
end
