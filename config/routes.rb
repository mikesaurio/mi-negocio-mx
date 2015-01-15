Rails.application.routes.draw do

  get 'business/pasos'

  devise_for :users



  get 'pages/quiere'
  get 'pages/encuesta'
  post "pages/quiere"
  post "pages/paso"
  get 'pages/encuesta'
  post "municipios/search"

  resources :inspection_lines
  resources :procedure_lines
  resources :procedure_requirements
  resources :inspection_requirements
  resources :lines
  resources :requirements
  resources :procedures
  resources :dependencies
  resources :imcos
  
  resources :municipios, only: [:show] do
    resources :inspections, only: [:index, :show]
    resources :inspectors, only: [:index, :show]
    resources :procedure_lines, only: [:show]
    resources :business, only: [:index]
    
    resources :procedures, only: [:index, :show] do
      resources :requirements, only: [:index, :show]
    end
    post 'business/steps'
    
    get 'tramite'
    post 'tramite'
  end
  


  namespace :dashboard do
    resources :inspections, only: [:new, :create, :edit, :update, :destroy]
    resources :inspectors, only: [:new, :create, :edit, :update, :destroy]
  end

    
  root 'imcos#index'
end
