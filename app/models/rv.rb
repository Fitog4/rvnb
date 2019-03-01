class Rv < ApplicationRecord
  belongs_to :user
  has_many :booking_requests

  validates :travelling_seats, :beds, :available_in, :available_from, :available_till, :price_per_night, presence: true
  geocoded_by :available_in
  after_validation :geocode, if: :will_save_change_to_available_in?
end
