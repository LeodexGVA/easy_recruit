class CandidatePolicy < ApplicationPolicy
  def index?
    user.user_type == "candidate"
  end

  
end
