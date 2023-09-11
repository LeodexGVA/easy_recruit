class JobOffer < ApplicationRecord
  # Associations
  belongs_to :company
  has_many :steps, dependent: :destroy
  has_many :candidatures, dependent: :destroy
  has_many :time_slots, through: :candidatures
  has_many :interviews, through: :time_slots
  # Validations
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :address, presence: true
  validates :skills, presence: true
  validates :requirements, presence: true
  validates :contract_type, presence: true, inclusion: { in: %w[CDI CDD Intérim] }
  validates :start_date, presence: true
  # validates :deadline, presence: true
  # validates :salaire, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date?

  private

  def end_date_after_start_date?
    if end_date.present? && start_date.present? && end_date <= start_date
      errors.add(:end_date, "End date must be after start date")
    end
  end
end
