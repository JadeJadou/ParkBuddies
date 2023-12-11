class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  AVATAR_CHOICES = ["AV_chicken_green.png","AV_chicken_yellow.png","AV_chicken_purple.png","AV_chicken_black_green.png", "AV_chicken_black_coral.png",

  "AV_fish_yellow.png","AV_fish_purple.png","AV_fish_black_green.png","AV_fish_black_coral.png",

  "AV_frog_yellow.png","AV_frog_black_coral.png","AV_frog_black_green.png","AV_frog_purple.png","AV_frog_green.png",

  "AV_kangaroo_black_coral.png", "AV_kangaroo_black_green.png", "AV_kangaroo_green.png", "AV_kangaroo_purple.png", "AV_kangaroo_yellow.png",

  "AV_pinguin_black_green.png","AV_pinguin_black_coral.png","AV_pinguin_green.png","AV_pinguin_purple.png","AV_pinguin_yellow.png",

  "AV_sheep_black_coral.png","AV_sheep_black_green.png","AV_sheep_green.png","AV_sheep_purple.png","AV_sheep_yellow.png",

  "AV_sloth_purple.png","AV_sloth_yellow.png","AV_sloth_black_green.png","AV_sloth_black_coral.png",

  "AV_toucan_green.png","AV_toucan_purple.png","AV_toucan_yellow.png","AV_toucan_black_green.png","AV_toucan_black_coral.png",

  "AV_turkey_black_coral.png","AV_turkey_black_green.png","AV_turkey_green.png","AV_turkey_purple.png","AV_turkey_yellow.png",
].sample(4)

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
