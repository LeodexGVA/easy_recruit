class JobOffer < ApplicationRecord
  # Associations
  belongs_to :company
  has_many :steps, dependent: :destroy
  has_many :candidatures, dependent: :destroy
  # Validations
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :industry, presence: true, inclusion: { in: %w[IT Finance Marketing Other] }
  validates :address, presence: true
  validates :skills, presence: true
  validates :requirements, presence: true
  validates :contract_type, presence: true, inclusion: { in: %w[Full-time Part-time] }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date?

  private

  def end_date_after_start_date?
    if end_date.present? && start_date.present? && end_date <= start_date
      errors.add(:end_date, "End date must be after start date")
    end
  end
end
