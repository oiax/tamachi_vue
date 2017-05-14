Rails.application.routes.draw do
  root "top#index"
  resources :users, except: [ :show, :destroy ]
end
