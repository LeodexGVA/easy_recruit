class JobOffersController < ApplicationController
  def index
    @job_offers = policy_scope(JobOffer)
  end

  def new
    @job_offer = JobOffer.new
    authorize @job_offer # vérifie l'autorisation avec Pundit
  end

  def create
    @job_offer = JobOffer.new(job_offer_params)
    authorize @job_offer # vérifie l'autorisation avec Pundit
    @job_offer.user = current_user # l'utilisateur courant est le recruteur

    if @job_offer.save
      redirect_to @job_offer
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @job_offer # vérifie l'autorisation avec Pundit
    @job_offer = JobOffer.find(params[:id])
  end

  def update
    authorize @job_offer # vérifie l'autorisation avec Pundit
    @job_offer = JobOffer.find(params[:id])
    if @job_offer.update(job_offer_params)
      redirect_to @job_offer
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @job_offer = JobOffer.find(params[:id]) # on récupère l'offre d'emploi
    @company = Company.find(params[:company_id]) # on récupère l'entreprise qui a posté l'offre d'emploi
    @candidatures = @job_offer.candidatures # on récupère les candidatures de l'offre d'emploi
    authorize @job_offer # vérifie l'autorisation avec Pundit
  end

  def destroy
    authorize @job_offer # vérifie l'autorisation avec Pundit
    @job_offer = JobOffer.find(params[:id])
    @job_offer.destroy
    redirect_to job_offers_path
  end

  private

  def job_offer_params
    params.require(:job_offer).permit(:title, :description, :industry, :address, :skills, :requirements, :contract_type, :start_date, :end_date, :company_id)
  end
end
