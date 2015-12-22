Rails.application.routes.draw do
  root 'events#index'
  
  resources :users
  resources :events do
    collection { post :import }
  end
end
