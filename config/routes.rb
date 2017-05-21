Rails.application.routes.draw do
  root "top#index"
  resources :users, except: [ :destroy ]
end
