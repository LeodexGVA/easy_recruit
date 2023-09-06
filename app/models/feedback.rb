class Feedback < ApplicationRecord
  # Associations
  belongs_to :interview, dependent: :destroy
  belongs_to :user, dependent: :destroy
  # has_one_attached :avatar
  # Validations
  validates :comment, presence: true, length: { minimum: 10 }
  validates :score, presence: true, inclusion: { in: 1..5 }
end
