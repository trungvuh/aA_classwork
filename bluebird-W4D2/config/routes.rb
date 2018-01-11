Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :chirps, only: [:index]
  end

  post '/search', to: 'users#search'

  resources :chirps
  resources :likes, only: [:create, :destroy]
end
