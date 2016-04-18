Rails.application.routes.draw do

   root 'welcome#index'

   resources :users

   get '/login', to: 'users#login', as: 'login_page'
   post '/login', to: 'users#new_session', as: 'login'
   delete '/logout', to: 'users#logout', as: 'logout'
 end
