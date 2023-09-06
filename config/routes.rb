Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root to: "pages#home"

  # Routes pour la gestion des offres d'emploi
  resources :companies, only: [] do
    resources :job_offers, only: [:show, :index, :edit, :update, :destroy]
  end
  resources :job_offers, only: [:index, :new, :create]

  # Routes pour la gestion des propositions d'entretien (time_slots)
  resources :time_slots
end
