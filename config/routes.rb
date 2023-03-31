Rails.application.routes.draw do
  get 'users/index'
  get 'users/edit'
  resources :commandes
  devise_for :users
  
  resources :utilisations do
    collection do
      get :ressources
    end
  end

  get '/utilisations/:id/traiter', to: 'utilisations#traiter', as: 'traiter_utilisation'
  get '/commandes/:id/livrer', to: 'commandes#livrer', as: 'livrer_commande'
  post '/commandes/:id/create_from', to: 'commandes#create_from', as: 'create_commande_from'

  resources :ressources
  resources :matieres
  resources :machines
  resources :utilisateurs
  resources :users
  resources :chantiers
  resources :clients
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'welcome/index'
  root "welcome#index"
end
