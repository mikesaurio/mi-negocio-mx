Rails.application.routes.draw do

  devise_for :users



  get 'pages/quiere'

  get 'pages/encuesta'

  get 'pages/tramite'
  
  post 'pages/tramite'

  get 'imcos/index'

  get "pages/nuevo_negocio"

  post "pages/quiere"

   get "pages/inspec"

  post "pages/paso"

  get 'pages/encuesta'

  get 'inspection_lines/index'

  get 'inspection_lines/show'

  get 'inspection_lines/edit'

  get 'inspection_lines/new'

  get 'inspection_requirements/index'

  get 'inspection_requirements/show'

  get 'inspection_requirements/edit'

  get 'inspection_requirements/new'

  get 'procedure_lines/index'

  get 'procedure_lines/show'

  get 'procedure_lines/edit'

  get 'procedure_lines/new'

  get 'procedure_requirements/index'

  get 'procedure_requirements/show'

  get 'procedure_requirements/edit'

  get 'procedure_requirements/new'

 # get 'procedure_requirements/edit'

  #get 'procedure_requirements/index'

  #get 'procedure_requirements/new'

  #get 'procedure_requirements/show'


  resources :inspection_lines

  resources :procedure_lines

  resources :procedure_requirements

  resources :inspection_requirements

  resources :lines

  resources :requirements

  resources :procedures

  resources :dependencies

  # resources :municipios

  resources :imcos

  resources :pages

  namespace :dashboard do
    resources :inspections, only: [:new, :create, :edit, :update, :destroy]
    resources :inspectors, only: [:new, :create, :edit, :update, :destroy]
  end


  resources :inspections, only: [:index, :show]
  resources :inspectors, only: [:index, :show]

  

  get 'autocompletar' => 'imcos#autocomplete'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'imcos#index'



  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
