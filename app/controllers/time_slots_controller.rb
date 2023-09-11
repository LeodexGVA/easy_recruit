class TimeSlotsController < ApplicationController
  def new
    @selected_candidatures_ids = params[:selected_candidatures]
    @selected_candidatures = Candidature.where(id: @selected_candidatures_ids)
    @time_slot = TimeSlot.new
    authorize @time_slot
  end

  def create
    @selected_candidatures_ids = params[:selected_candidatures]
    @selected_candidatures = Candidature.where(id: @selected_candidatures_ids)
    @job_offer = @selected_candidatures.first.job_offer

    # Variable pour suivre si la création de tous les créneaux horaires a réussi
    all_time_slots_created = true

    @selected_candidatures_ids.each do |candidature_id|
      time_slot = TimeSlot.new(time_slot_params)
      time_slot.candidature_id = candidature_id.to_i
      time_slot.status = "Pending"
      authorize time_slot

      unless time_slot.save
        # Si la sauvegarde échoue pour l'une des candidatures alors on passe la variable à false
        all_time_slots_created = false
      end
    end

    if all_time_slots_created
      # Redirection si succès
      redirect_to job_offer_path(@job_offer)
      flash[:notice] = "Proposition d'entretien envoyée au(x) candidat(s) sélectioné(s) !"
    else
      # Redirection si échec
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @time_slot = TimeSlot.find(params[:id])
    authorize @time_slot
  end

  private

  def time_slot_params
    params.require(:time_slot).permit(:date, :time)
  end
end
