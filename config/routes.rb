Rails.application.routes.draw do

  devise_for :users
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
    resources :procedure_lines, only: [:index,:show]
    resources :business, only: [:index]
      post 'business/steps'
  end

  resource :dashboard, only: :show, controller: :dashboard do
    resources :inspections, only: [:new, :create, :edit, :update, :destroy], controller: 'dashboard/inspections'
    resources :inspectors, only: [:new, :create, :edit, :update, :destroy], controller: 'dashboard/inspectors'
  end

  root 'imcos#index'
end
