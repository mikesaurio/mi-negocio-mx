Rails.application.routes.draw do

  devise_for :users



  get 'pages/quiere'
  get 'pages/encuesta'
  post "pages/quiere"
  post "pages/paso"
  get 'pages/encuesta'
  post "municipios/show"

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
    get 'open'
    post 'open'
     get 'tramite'
    post 'tramite'
    get 'inspeccion'
    post 'inspeccion'
  end




  namespace :dashboard do
    resources :inspections, only: [:new, :create, :edit, :update, :destroy]
    resources :inspectors, only: [:new, :create, :edit, :update, :destroy]
  end

  get 'autocompletar' => 'imcos#autocomplete'
  #http://localhost:3000/autocompletar?query=ch
    
  root 'imcos#index'
end
