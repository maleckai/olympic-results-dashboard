Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :sports, only: [:index, :show] do
    get 'events', to: 'sport_events#index'
  end

  resources :events, only: :index
  namespace :events do
    get 'upcoming', to: 'upcoming_events#index'
    get 'in_progress', to: 'in_progress_events#index'
  end

end
