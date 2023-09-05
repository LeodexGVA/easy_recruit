class Step < ApplicationRecord
  # Associations
  belongs_to :job_offer, dependent: :destroy
  # Validations
  validates :minimum_quota, presence: true
  validates :numbers, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
