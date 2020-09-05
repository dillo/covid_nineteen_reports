require 'sidekiq/web'

Rails.application.routes.draw do
  resources :pandemics
  resources :data_urls

  root 'pandemics#index'

  post 'generate_report', to: 'reports#create'

  mount Sidekiq::Web => '/sidekiq'
end
