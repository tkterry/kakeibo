Rails.application.routes.draw do
  get 'types/new'

 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'static_pages/home'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  post 'signup' => 'users#create'
  root to: 'static_pages#home'
  resources :types
  resources :receipts
  resources :users
end
