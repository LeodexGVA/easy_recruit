class Feedback < ApplicationRecord
  # Associations
  belongs_to :interview #, dependent: :destroy
  belongs_to :user#, dependent: :destroy
  # has_one_attached :avatar
  # Validations
  validates :comment, presence: true, length: { minimum: 10 }
  validates :score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  def score_as_stars
    return "" if score.nil?
    # Convertissez le score en HTML avec des étoiles, par exemple, en utilisant des balises <i> ou <span> et des classes CSS pour les étoiles pleines ou vides
    stars = "<i class='fa fa-star star-icon'></i>" * score
    empty_stars = "<i class='fa fa-star-o star-icon'></i>" * (5 - score)
    (stars + empty_stars).html_safe
  end
end
