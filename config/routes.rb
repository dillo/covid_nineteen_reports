Rails.application.routes.draw do
  resources :pandemics

  root "pandemics#index"
end
