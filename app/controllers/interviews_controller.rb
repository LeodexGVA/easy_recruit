class InterviewsController < ApplicationController
  def index
    @interviews = policy_scope(Interview)
    @interviews = JobOffer.where(user_id: current_user.id) # on récupère toutes les entretiens du candidat
  end

  def new
    @interview = Interview.new
    authorize @interview # vérifie l'autorisation avec Pundit
  end

  def create
    @interview = Interview.new(job_offer_params)
    @interview.user = current_user # l'utilisateur courant est le recruteur
    authorize @interview # vérifie l'autorisation avec Pundit


    if @interview.save
      redirect_to interview_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @feedback = Feedback.new
    @interview = Interview.find(params[:id]) # on récupère la candidature
    @time_slot = @interview.time_slot # on récupère le status de l'interview
    @candidate = @interview.time_slot.candidature.user # on récupère le candidat
    @user = @interview.user
    @feedbacks = @interview.feedbacks # on récupère les feedbacks de l'interview
    authorize @interview # vérifie l'autorisation avec Pundit
  end
end
