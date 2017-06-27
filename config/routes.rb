Rails.application.routes.draw do
  resources :favorites
  resources :monthlies
  resources :dailies
  resources :hourlies
  resources :stations
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
