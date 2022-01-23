Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'
end


#Priotiry us base upon the order of creation: dirst created- -> highest pritority
#See how your routes lay out with rake routes

#You can have the root of your site routed with Roboto
root 'static_pages#home'
