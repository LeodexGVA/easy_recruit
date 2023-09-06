class TimeSlotsController < ApplicationController
  def new
    @time_slot = TimeSlot.new
    @job_offers = JobOffer.where(company_id: current_user.company.id) # on récupère toutes les offres d'emploi du recruteur
    @job_offers_titles = @job_offers.map { |job_offer| job_offer.title }

    authorize @time_slot # vérifie l'autorisation avec Pundit
  end

  def create
    case params[:step]
    when '1'
      # Étape 1 : Sélection de l'offre
      @time_slot = TimeSlot.new(time_slot_params)
      authorize @time_slot # vérifie l'autorisation avec Pundit
      if @time_slot.save
        # Passez à l'étape 2
        redirect_to new_time_slot_path(step: 2, time_slot_id: @time_slot.id)
      else
        # Gérez les erreurs
        render 'new'
      end
    when '2'
      # Étape 2 : Sélection des candidats
      @time_slot = TimeSlot.find(params[:time_slot_id])
      authorize @time_slot # vérifie l'autorisation avec Pundit
      @candidatures = Candidature.where(job_offer_id: @time_slot.job_offer_id)
      # Validez et traitez les candidatures sélectionnées
      # Vous pouvez utiliser params[:selected_candidatures] pour obtenir les candidatures sélectionnées
      if @time_slot.update(time_slot_params)
        # Passez à l'étape 3
        redirect_to new_time_slot_path(step: 3, time_slot_id: @time_slot.id)
      else
        # Gérez les erreurs
        render 'new'
      end
    when '3'
      # Étape 3 : Création du créneau
      @time_slot = TimeSlot.find(params[:time_slot_id])
      authorize @time_slot # vérifie l'autorisation avec Pundit
      # Validez et traitez les informations pour la création du créneau
      if @time_slot.update(time_slot_params)
        # Redirigez ou affichez un message de succès
        redirect_to success_path
      else
        # Gérez les erreurs
        render 'new'
      end
    else
      # Gérez les cas d'erreur ici
      render 'new'
    end
  end


  private

  def time_slot_params
    params.require(:time_slot).permit(:date, :time, :status, candidature_ids: [])
  end
end
