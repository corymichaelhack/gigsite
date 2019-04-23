Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static_pages#index'
  
  resources :sites, only: [:index, :show] do
    resources :notes, only: [:new, :create, :index]
  end
  resources :gigs, only: [:new, :create, :index, :show] do
    resources :sites, only: [:index, :show, :new, :create]
  end
    
  
end
