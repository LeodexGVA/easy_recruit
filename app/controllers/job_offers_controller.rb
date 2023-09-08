class JobOffersController < ApplicationController
  def index
    @job_offers = policy_scope(JobOffer)
    @job_offers = JobOffer.where(company_id: current_user.company.id) # on récupère toutes les offres d'emploi du recruteur
  end

  def new
    @job_offer = JobOffer.new
    @company = current_user.company # l'utilisateur courant est le recruteur
    authorize @job_offer # vérifie l'autorisation avec Pundit
  end

  def create
    @job_offer = JobOffer.new(job_offer_params)

    @job_offer.company = current_user.company # l'utilisateur courant est le recruteur
    authorize @job_offer # vérifie l'autorisation avec Pundit

    if @job_offer.save
      redirect_to company_job_offers_path(current_user.company)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @job_offer = JobOffer.find(params[:id])
    authorize @job_offer # vérifie l'autorisation avec Pundit
  end

  def update
    @job_offer = JobOffer.find(params[:id])
    authorize @job_offer # vérifie l'autorisation avec Pundit
    if @job_offer.update(job_offer_params)
      redirect_to @job_offer
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @job_offer = JobOffer.find(params[:id]) # on récupère l'offre d'emploi
    @company = @job_offer.company # on récupère l'entreprise qui a posté l'offre d'emploi
    @candidatures = @job_offer.candidatures # on récupère les candidatures de l'offre d'emploi
    @time_slots = @job_offer.time_slots # on récupère les créneaux horaires de l'offre d'emploi
    @interviews = @job_offer.interviews # Assurez-vous que cette ligne est présente pour récupérer les entretiens.
    authorize @job_offer # vérifie l'autorisation avec Pundit
  end

  def destroy
    @job_offer = JobOffer.find(params[:id])
    @job_offer.destroy
    authorize @job_offer # vérifie l'autorisation avec Pundit
    redirect_to job_offers_path # on redirige vers la liste des offres d'emploi
  end

  private

  def job_offer_params
    params.require(:job_offer).permit(:title, :description, :industry, :address, :skills, :requirements, :contract_type, :start_date, :end_date, :company_id)
  end
end
