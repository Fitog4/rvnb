class BookingRequest < ApplicationRecord
  belongs_to :rv
  belongs_to :user

  validates :status, inclusion: { in: ['pending', 'approved', 'paid'] }
  validates :location, :date_from, :date_till, presence: true
  validate :valid_dates?

  private

  def valid_dates?
    # date_till >= date_from >= Date.today
    unless date_till >= date_from
      errors.add(:date_till, 'Booking end date must be after booking start date')
    end
    unless date_from >= Date.today
      errors.add(:date_from, 'Booking start date must be today or in the future')
    end
  end
end
