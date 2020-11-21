Rails.application.routes.draw do

  get '/', to: 'home#index'

  scope module: :v1, constraints: ApiVersion.new('v1', true) do

    resources :companies, only: [:show, :create, :update] do
      scope module: :companies do
        resources :extinguishers, only: [:index]
      end
    end

    resources :extinguishers, only: [:show, :create, :update] do
      resources :controls, module: :extinguishers, only: [:index, :create]
    end

    resources :controls, only: [:show]

    get '/search/companies', to: 'companies#search'
  end

end
