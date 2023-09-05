class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations candidats
  has_many :applications, dependent: :destroy
  has_many :job_offers_as_candidate, through: :applications, source: :job_offers
  # Associations recruteurs
  has_many :job_offers_as_recruiter, through: :companies, source: :job_offers
  has_one :company, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  # Associations cloudinary
  has_one_attached :avatar
  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :user_type, presence: true, inclusion: { in: %w[Candidate Recruiter] }
  validates :address, presence: true
  validates :phone, presence: true
end
