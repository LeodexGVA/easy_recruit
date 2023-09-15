class Candidature < ApplicationRecord
  # Associations
  belongs_to :job_offer
  belongs_to :user
  has_many :time_slots, dependent: :destroy
  has_many :interviews, through: :time_slots

  # Validations
  validates :job_offer, presence: true
  validates :user, presence: true
  validates :status, presence: true, inclusion: { in: %w[submitted accepted rejected] }

  # # Callbacks
  # after_initialize :set_default_status, if: :new_record?

  # Cloudinary
  has_one_attached :cv
  has_one_attached :lettre_motivation

  # private

  # def set_default_status
  #   self.status = 'submitted'
  # end
end
