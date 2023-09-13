class TimeSlot < ApplicationRecord
  # Trad des status
  STATUSES = {
    'Pending' => 'En attente',
    'Accepted' => 'Accepté',
    'Rejected' => 'Rejeté'
  }.freeze

  # Associations
  belongs_to :candidature
  has_many :interviews, dependent: :destroy
  # Validations
  validates :time, presence: true
  validates :date, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES.keys }
  validate :date_must_be_in_the_future

  def translated_status
    STATUSES[status]
  end

  private


  def date_must_be_in_the_future
    if date.present? && date <= Date.today
      errors.add(:date, "doit être supérieure à la date d'aujourd'hui")
    end
  end
end
