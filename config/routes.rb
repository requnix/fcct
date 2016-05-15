Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :members

  # Static pages
  get '/sponsors', to: 'application#sponsors', as: :sponsors

  # Resources
  resources :activities, only: [:index]
  resources :calendars, only: [:index]
  resources :members, only: [:index, :edit, :update]

  # Backend
  ActiveAdmin.routes(self)

  # Homepage
  root to: 'application#home', as: :home

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
