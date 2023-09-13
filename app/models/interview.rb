class Interview < ApplicationRecord
  #Translated statuses
  STATUSES = {
    'Upcoming' => 'En attente',
    'Done' => 'Terminé',
    'Cancelled' => 'Annulé'
  }.freeze

  # Associations
  belongs_to :time_slot
  belongs_to :user
  has_many :feedbacks, dependent: :destroy
  # Validations
  validates :status, presence: true, inclusion: { in: %w[Upcoming Done Cancelled] }

  def translated_status
    STATUSES[status]
  end
end
