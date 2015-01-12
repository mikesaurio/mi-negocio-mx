Rails.application.routes.draw do

  devise_for :users



  get 'pages/quiere'
  get 'pages/encuesta'
  #get 'pages/tramite'
  #post 'pages/tramite'
  # get 'imcos/index'
 # get "pages/nuevo_negocio"
  post "pages/quiere"
  get "pages/inspec"
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
    get 'open'
    post 'open'
     get 'tramite'
    post 'tramite'
  end




  namespace :dashboard do
    resources :inspections, only: [:new, :create, :edit, :update, :destroy]
    resources :inspectors, only: [:new, :create, :edit, :update, :destroy]
  end

  get 'autocompletar' => 'imcos#autocomplete'
  #http://localhost:3000/autocompletar?query=ch
    
  root 'imcos#index'
end
