class Application < ApplicationRecord
  # Associations
  belongs_to :job_offer
  belongs_to :user
  has_many :time_slots, dependent: :destroy
  has_many :interviews, through: :time_slots
  has_many_attached :files
  # Validations
  validates :job_offer, presence: true
  validates :user, presence: true
  validates :status, presence: true, inclusion: { in: %w[submitted accepted rejected] }

  # Callbacks
  after_initialize :set_default_status, if: :new_record?

  # Methods
  private

  def set_default_status
    self.status = 'submitted'
  end
end
