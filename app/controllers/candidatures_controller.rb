class CandidaturesController < ApplicationController
  def index
    @candidatures = policy_scope(Candidature)
    @candidatures = Candidature.where(job_offer_id: params[:job_offer_id])
  end

  def update
    @candidature = Candidature.find(params[:id])
    authorize @candidature # vérifie l'autorisation avec Pundit
    if @candidature.update(candidate_params)
      redirect_to @candidature
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @candidature = Candidature.find(params[:id])
    authorize @candidature # vérifie l'autorisation avec Pundit
    @candidature.destroy
    redirect_to job_offer_path # on redirige vers la liste des offres d'emploi
  end

  private

  def candidate_params
    params.require(:candidature).permit(:title, :description, :industry, :address, :skills, :requirements, :contract_type, :start_date, :end_date, :company_id)
  end
end
