require 'sidekiq/web'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :applications, only: [:index, :create]
  resources :chats, only: [:create]
  get 'applications/:app_token/chats', to: 'chats#index'
  resources :messages, only: [:create]
  get 'applications/:app_token/chats/:chat_number_id/messages', to: 'messages#index'
  post 'messages/search', to: 'messages#search_text'

  mount Sidekiq::Web => "/sidekiq"

  # Defines the root path route ("/")
  # root "posts#index"
end
