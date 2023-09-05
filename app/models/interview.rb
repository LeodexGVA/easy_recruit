class Interview < ApplicationRecord
  # Associations
  belongs_to :time_slot
  has_many :feedbacks, dependent: :destroy
  # Validations
  validates :status, presence: true, inclusion: { in: %w[Upcoming Done Cancelled] }
end
