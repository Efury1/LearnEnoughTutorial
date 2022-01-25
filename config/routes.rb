Rails.application.routes.draw do
  get 'sessions/new'
  root           'static_pages#home'
  get 'about'   => 'static_pages#about'
  get 'help'    => 'static_pages#help'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
  get 'login'   => 'sessions#new'
  post 'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :microposts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
