Rails.application.routes.draw do
  resources :pandemics
  resources :data_urls

  root 'pandemics#index'
end
