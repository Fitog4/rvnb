class Rv < ApplicationRecord
  belongs_to :user
  has_many :booking_requests

  validates :travelling_seats, :beds, :available_in, :available_from, :available_till, presence: true
end
