Rails.application.routes.draw do

  resources :commandes do
    collection do
      get :list
      post :list
      get ':id/details', to: 'commandes#details', as: 'details_commande'
    end
  end

  resources :fournisseurs
  get 'users/index'
  get 'users/edit'
  resources :achats
  devise_for :users
  
  resources :utilisations do
    collection do
      get :ressources
      post :trier
    end
  end

  post '/utilisations/:id/traiter', to: 'utilisations#traiter', as: 'traiter_utilisation'
  post '/achats/:id/livrer', to: 'achats#livrer', as: 'livrer_achat'
  post '/commandes/:id/livrer', to: 'commandes#livrer', as: 'livrer_commande'
  post '/achats/:id/create_from', to: 'achats#create_from', as: 'create_achat_from'
  post '/achats/create_from_virtuelle', to: 'achats#create_from_virtuelle', as: 'create_achat_from_virtuelle'
  post "/chantiers/:id/trier_par_ressources", to: 'utilisations#trier_par_ressources', as: 'trier_par_ressources_utilisations'

  resources :ressources
  resources :matieres
  resources :machines
  resources :utilisateurs
  resources :users
  resources :chantiers do
    collection do
      get :list
      post :list
    end
    member do
      post :cloturer
    end
  end
  resources :clients
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'welcome/index'
  root "welcome#index"
end
