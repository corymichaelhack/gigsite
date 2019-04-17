Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static_pages#index'

  namespace :admin do
    resources :gigs, only: [:new, :create, :show]
  end
end
