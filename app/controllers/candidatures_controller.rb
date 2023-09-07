class CandidaturesController < ApplicationController
  def index
    @candidatures = policy_scope(Candidature)
    @candidatures = Candidature.all
  end
end
