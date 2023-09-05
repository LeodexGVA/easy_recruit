class TimeSlot < ApplicationRecord
  # Associations
  belongs_to :application
  has_many :interviews
  # Validations
  validates :time, presence: true
  validates :date, presence: true
  validates :status, presence: true, inclusion: { in: %w[Pending Accepted Rejected] }

  validate :date_must_be_in_the_future

  private

  def date_must_be_in_the_future
    if date.present? && date <= Date.today
      errors.add(:date, "doit être supérieure à la date d'aujourd'hui")
    end
  end
end
