class JobOfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.admin? ? scope.all : scope.where(user_type: current_user.user_type)
    end
  end
  def index
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
