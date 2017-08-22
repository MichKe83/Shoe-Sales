Rails.application.routes.draw do
  root "users#index"

  get 'register' => 'users#new'
  post 'users' => 'users#create'
  get 'users/:id' => 'users#show', as: :user
  patch "users/:id" => "users#update"
  get 'users/:id/edit' => "users#edit"
  delete "users/:id" => "users#destroy"

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'shoes/:id' => 'shoes#show', as: :shoes
  post 'shoes' => 'shoes#create'
  post  'shoes/:id' => 'shoes#buy'
  delete "shoes/:id" => "shoes#destroy"

  get 'dashboard' => 'shoes#dashboard'

end
