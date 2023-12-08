class Park < ApplicationRecord
  has_one :chatroom
  has_many :favorites
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo

  # scope :search_by_name_and_address, ->(query) {
  #   where("name LIKE ? OR address LIKE ?", "%#{query}%", "%#{query}%")
  # }
end
