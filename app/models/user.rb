class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
  has_many :chatrooms, through: :messages
  has_many :favorites
  has_many :parks, through: :favorites
  has_many :private_chatrooms
  has_many :private_messages
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, presence: true, uniqueness: true
  validates :address, presence: true
  validates :kids_average_age, presence: true
  validates :kids_count, presence: true
end
