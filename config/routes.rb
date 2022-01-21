Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/resume'
  resources :microposts
  resources :users
  get 'welcome/homepage'
  root 'welcome#homepage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
