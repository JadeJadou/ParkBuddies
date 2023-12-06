class Park < ApplicationRecord
  has_one :chatroom
  has_many :favorites
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo
end
