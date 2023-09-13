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
  validates :time, presence: true, format: { with: /\A\d{2}:\d{2}\z/, message: "Le format de l'heure doit être hh:mm" }
  validates :date, presence: true, format: { with: /\A\d{2}\/\d{2}\/\d{4}\z/, message: "Le format de la date doit être jj/mm/aaaa" }
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
