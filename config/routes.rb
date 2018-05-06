Rails.application.routes.draw do
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'static_pages/home'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  post 'signup' => 'users#create'
  root to: 'static_pages#home'
  resources :receipts
  resources :users
  put '/types/:id/sort', to: 'types#sort', as: 'type_sort'
  resources :types
end
