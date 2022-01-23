Rails.application.routes.draw do
  root           'static_pages#home'
  get 'about'   => 'static_pages#about'
  get 'help'    => 'static_pages#help'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
  resources :microposts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
