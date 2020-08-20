Rails.application.routes.draw do
  resources :pandemics do
    resources :data_urls
  end

  root 'pandemics#index'
end
