Rails.application.routes.draw do
  root to: 'participants#index'
  resources :participants do
    member do
    put "approve"
    end
  end
  devise_for :users
  #map.resources.participants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
