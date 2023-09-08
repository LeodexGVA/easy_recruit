class CandidaturesController < ApplicationController
  def index
    @candidatures = policy_scope(Candidature)
    # Candidatures relative à une offre d'emploi spécifique
    @candidatures = Candidature.where(job_offer_id: params[:job_offer_id])
  end
  
   def create
    # Accédez aux IDs des candidatures sélectionnées dans le formulaire
    @selected_candidatures_ids = params[:selected_candidatures]
    authorize @selected_candidatures_ids # vérifie l'autorisation avec Pundit

    if @selected_candidatures_ids.empty?
      # Si aucun ID sélectionné ou plus d'un ID sélectionné, affiche un message d'erreur
      flash[:error] = "Sélectionnez une et une seule candidature pour passer à l'étape suivante."
      redirect_to candidatures_path # Restez sur la page actuelle (index)
    else
      # Si une seule candidature est sélectionnée, redirigez vers l'étape suivante (par exemple, la page de création de rendez-vous dans le contrôleur TimeSlotsController)
      redirect_to new_time_slot_path
    end
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
