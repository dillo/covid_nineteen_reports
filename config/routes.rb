Rails.application.routes.draw do
  resources :pandemics
  resources :data_urls
  resources :pandemic_data_associations

  root 'pandemics#index'
end
