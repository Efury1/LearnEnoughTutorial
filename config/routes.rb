Rails.application.routes.draw do
  resources :users
  get 'welcome/homepage'
  root 'welcome#homepage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
