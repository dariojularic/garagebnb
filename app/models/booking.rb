class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :garage
  validate :start_date_after_end_date?
  validates :start_date, :end_date, presence: true

  def start_date_after_end_date?
    return if [end_date.blank?, start_date.blank?].any?
    if end_date < start_date
      errors.add(:end_date, "can't be before start date")
    end
  end
end
