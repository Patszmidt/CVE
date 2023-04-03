Rails.application.routes.draw do
  get 'users/index'
  get 'users/edit'
  resources :commandes
  devise_for :users
  
  resources :utilisations do
    collection do
      get :ressources
      post :trier
    end
  end

  post '/utilisations/:id/traiter', to: 'utilisations#traiter', as: 'traiter_utilisation'
  post '/commandes/:id/livrer', to: 'commandes#livrer', as: 'livrer_commande'
  post '/commandes/:id/create_from', to: 'commandes#create_from', as: 'create_commande_from'
  post "/chantiers/:id/trier_par_ressources", to: 'utilisations#trier_par_ressources', as: 'trier_par_ressources_utilisations'

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
