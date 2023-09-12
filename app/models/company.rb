class Company < ApplicationRecord
  # Associations
  belongs_to :user, optional: true
  has_many :job_offers, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }, uniqueness: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :industry, presence: true, inclusion: { in: %w[IT Finance Marketing Other] }

  # Callbacks
  after_initialize :set_default_industry, if: :new_record?

  # Cloudinary
  has_one_attached :logo

  private

  def set_default_industry
    self.industry = 'Other'
  end
end
