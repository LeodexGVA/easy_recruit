class ApplicationController < ActionController::Base
  # On veut que l'utilisateur soit connecté pour accéder à toutes les pages
  before_action :set_current_user
  before_action :authenticate_user!
  include Pundit::Authorization

  # Pundit: allow-list approach
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  # app/controllers/application_controller.rb def default_url_options { hôte : ENV["easyrecruit.site"] || "localhost:3000" } fin

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  # Définit l'utilisateur actuellement connecté
  def set_current_user
    @current_user = current_user
  end
end
