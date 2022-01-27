Rails.application.routes.draw do
  resources :places, except: [:update, :edit, :destroy]
  get 'sessions/new'
  root           'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
  get 'users'   => 'users#index'
  get 'login'   => 'sessions#new'
  get 'places'  => 'places#index'
  post 'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :microposts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
