class Rv < ApplicationRecord
  belongs_to :user
  has_many :booking_requests
end
