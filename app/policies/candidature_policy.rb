class CandidaturePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    # tous le monde peut voir les candidatures
    true
  end

  # Seulement les recruteurs peuvent modifier une candidature
  def update?
    true
  end

  def show?
    # tous le monde peut voir une candidature
    true
  end

  # Seulement les recruteurs peuvent supprimer une candidature
  def destroy?
    user.recruiter? || user.admin?
  end

  def create?
    user.candidate? || user.admin?
  end
end
