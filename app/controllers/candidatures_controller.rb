class CandidaturesController < ApplicationController
  def index
    @candidatures = policy_scope(Candidature)
    @candidatures = Candidature.where(job_offer_id: params[:job_offer_id])
  end
end
