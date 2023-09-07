Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root to: "pages#home"

  resources :job_offers, only: [] do
    resources :interviews, only: [:show, :index, :edit, :update, :destroy]
  end

  resources :job_offers, only: [] do
    resources :candidatures
  end


  resources :companies, only: [] do
    resources :job_offers, only: [:index, :new, :create]
  end

resources :job_offers

  resources :interviews, only: [:show, :index, :edit, :update, :destroy] do
    resources :feedbacks, only: [:new, :create, :update]
  end

  resources :time_slots
end
