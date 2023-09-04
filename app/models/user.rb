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
  has_many :companies, optional: true
  has_many :feedbacks, dependent: :destroy
end
