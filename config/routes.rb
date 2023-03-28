Rails.application.routes.draw do
  
  resources :utilisations do
    collection do
      get :ressources
    end
  end
  get '/utilisations/:id/traiter', to: 'utilisations#traiter', as: 'traiter_utilisation'
  resources :ressources
  resources :matieres
  resources :machines
  resources :utilisateurs
  get 'welcome/index'
  resources :chantiers
  resources :clients
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
