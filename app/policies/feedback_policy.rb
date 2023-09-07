class FeedbackPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.recruiter? || user.admin?
        # Les recruteurs et les administrateurs voient toutes les offres
        scope.all
      else
        # Les utilisateurs réguliers voient les offres liées à leur entreprise
        scope.joins(company: :user).where(users: { id: user.id })
      end
    end
  end
  def index?
    # tous le monde peut voir les offres d'emploi
    true
  end

  def show?
    true
  end

  # Seulement les recruteurs peuvent créer une offre d'emploi
  def create?
    user.recruiter? || user.admin?
  end

  # Seulement les recruteurs peuvent modifier une offre d'emploi
  def update?
    user.recruiter? || user.admin?
  end

  # Seulement les recruteurs peuvent supprimer une offre d'emploi
  def destroy?
    user.recruiter? || user.admin?
  end
end
