Rails.application.routes.draw do

  get '/', to: 'home#index'

  resources :companies, only: [:show, :create, :update] do
    scope module: :companies do
      resources :extinguishers, only: [:index]
    end
  end

  resources :extinguishers, only: [:show, :create, :update] do
    resources :controls, module: :extinguishers, only: [:index, :create]
  end

  resources :users do
    scope module: :users do 
      resources :controls
    end
  end
  
  resources :controls, only: [:create, :show, :update, :destroy]

  get '/search/companies', to: 'companies#search'

end
