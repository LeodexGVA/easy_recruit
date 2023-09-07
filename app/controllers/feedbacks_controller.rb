class FeedbacksController < ApplicationController
  before_action :find_interview # Assurez-vous que l'interview existe avant d'ajouter un feedback
  before_action :authenticate_user! # Assurez-vous que l'utilisateur est connecté

  def new
    @feedback = Feedback.new
    authorize @feedback # Vérifie l'autorisation avec Pundit pour le feedback
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @user = current_user
    @time_slot = @interview.time_slot # on récupère le status de l'interview
    @feedbacks = @interview.feedbacks
    @feedback.user_id = current_user.id # Assignez l'ID de l'utilisateur actuel
    @feedback.interview_id = @interview.id # Associez le feedback à l'interview
    authorize @feedback  # Vérifiez l'autorisation avec Pundit pour le feedback
    if @feedback.save
      redirect_to interview_path(@interview), notice: 'Feedback créé avec succès.'
    else
      render "interviews/show", status: :unprocessable_entity
    end
  end

  private

  def find_interview
    @interview = Interview.find(params[:interview_id])
  end

  def feedback_params
    params.require(:interview).permit(:comment, :score)
  end
end
