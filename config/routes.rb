Rails.application.routes.draw do

  devise_for :users
  post "municipios/search"
   resources :procedure_requirements, only: [:index]#Para pruebas

   get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :municipios, only: [:show] do
    resources :inspections, only: [:index, :show]
    resources :inspectors, only: [:index, :show]
    resources :procedure_lines, only: [:index,:show]
    resources :formation_steps, only: [:index]

  end

  resource :dashboard, only: :show, controller: :dashboard do
    resources :inspections, only: [:index, :new, :create, :edit, :update, :destroy], controller: 'dashboard/inspections'
    resources :inspectors, only: [:index, :new, :create, :edit, :update, :destroy], controller: 'dashboard/inspectors'
    resources :formation_steps, only: [:index, :new, :create, :edit, :update, :destroy], controller: 'dashboard/formation_steps'
    resources :lines, only: [:index, :new, :create, :edit, :update, :destroy], controller: 'dashboard/lines'
    resources :dependencies, only: [:index, :new, :create, :edit, :update, :destroy], controller: 'dashboard/dependencies'
    resources :requirements, only: [:index, :new, :create, :edit, :update, :destroy], controller: 'dashboard/requirements'
    resources :procedures, only: [:index, :new, :create, :edit, :update, :destroy], controller: 'dashboard/procedures'
  end

  root 'imcos#index'
end
