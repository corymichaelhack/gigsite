Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static_pages#index'
  

  # resources :gigs, only: [:index, :show]
  # resources :sites, only: [:index, :show]
  # resources :notes, only: [:index, :show]


 
    resources :sites, only: [:index, :show] do
      resources :notes, only: []
    end
    resources :gigs, only: [:index, :show] do
      resources :sites, only: [:index, :show]
    end
    


  namespace :admin do
    resources :sites, only: [:index, :show] do
      resources :notes, only: [:new, :create]
    end
    resources :gigs, only: [:new, :create, :show] do
      resources :sites, only: [:index, :show, :new, :create]
    end
    
  end
end
