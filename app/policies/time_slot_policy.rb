class TimeSlotPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    true
  end
  # Seulement les recruteurs peuvent créer une proposition d'entretien (time_slot)
  def create?
    user.recruiter? || user.admin?
  end

  def update?
    user.recruiter? || user.admin?
  end

  def destroy?
    user.recruiter? || user.admin?
  end

end
