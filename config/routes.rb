Rails.application.routes.draw do
  resources :convertedfiles
  resources :users, only: [:create, :show]
  resources :sessions, only: [:create]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
