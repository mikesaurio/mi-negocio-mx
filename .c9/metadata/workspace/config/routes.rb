{"changed":true,"filter":false,"title":"routes.rb","tooltip":"/config/routes.rb","value":"Rails.application.routes.draw do\n\n  devise_for :users\n\n\n\n  get 'pages/quiere'\n  get 'pages/encuesta'\n  get 'pages/tramite'\n  post 'pages/tramite'\n  # get 'imcos/index'\n  get \"pages/nuevo_negocio\"\n  post \"pages/quiere\"\n  get \"pages/inspec\"\n  post \"pages/paso\"\n  get 'pages/encuesta'\n  # get 'inspection_lines/index'\n  # get 'inspection_lines/show'\n  # get 'inspection_lines/edit'\n  # get 'inspection_lines/new'\n  # get 'inspection_requirements/index'\n  # get 'inspection_requirements/show'\n  # get 'inspection_requirements/edit'\n  # get 'inspection_requirements/new'\n  # get 'procedure_lines/index'\n  # get 'procedure_lines/show'\n  # get 'procedure_lines/edit'\n  # get 'procedure_lines/new'\n  # get 'procedure_requirements/index'\n  # get 'procedure_requirements/show'\n  # get 'procedure_requirements/edit'\n  # get 'procedure_requirements/new'\n  # get 'procedure_requirements/edit'\n  # get 'procedure_requirements/index'\n  # get 'procedure_requirements/new'\n  # get 'procedure_requirements/show'\n\n\n  resources :inspection_lines\n  resources :procedure_lines\n  resources :procedure_requirements\n  resources :inspection_requirements\n  resources :lines\n  resources :requirements\n  resources :procedures\n  resources :dependencies\n  # resources :municipios\n  resources :pages\n  resources :imcos\n\n  namespace :dashboard do\n    resources :inspections, only: [:new, :create, :edit, :update, :destroy]\n    resources :inspectors, only: [:new, :create, :edit, :update, :destroy]\n  end\n\n\n  resources :inspections, only: [:index, :show]\n  resources :inspectors, only: [:index, :show]\n\n  \n\n  get 'autocompletar' => 'imcos#autocomplete'\n  #http://localhost:3000/autocompletar?query=ch\n    \n  # The priority is based upon order of creation: first created -> highest priority.\n  # See how all your routes lay out with \"rake routes\".\n\n  # You can have the root of your site routed with \"root\"\n  root 'imcos#index'\n\n\n\n  # Example of regular route:\n  #   get 'products/:id' => 'catalog#view'\n\n  # Example of named route that can be invoked with purchase_url(id: product.id)\n  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase\n\n  # Example resource route (maps HTTP verbs to controller actions automatically):\n  #   resources :products\n\n  # Example resource route with options:\n  #   resources :products do\n  #     member do\n  #       get 'short'\n  #       post 'toggle'\n  #     end\n  #\n  #     collection do\n  #       get 'sold'\n  #     end\n  #   end\n\n  # Example resource route with sub-resources:\n  #   resources :products do\n  #     resources :comments, :sales\n  #     resource :seller\n  #   end\n\n  # Example resource route with more complex sub-resources:\n  #   resources :products do\n  #     resources :comments\n  #     resources :sales do\n  #       get 'recent', on: :collection\n  #     end\n  #   end\n\n  # Example resource route with concerns:\n  #   concern :toggleable do\n  #     post 'toggle'\n  #   end\n  #   resources :posts, concerns: :toggleable\n  #   resources :photos, concerns: :toggleable\n\n  # Example resource route within a namespace:\n  #   namespace :admin do\n  #     # Directs /admin/products/* to Admin::ProductsController\n  #     # (app/controllers/admin/products_controller.rb)\n  #     resources :products\n  #   end\nend\n","undoManager":{"mark":-1,"position":10,"stack":[[{"group":"doc","deltas":[{"start":{"row":47,"column":0},"end":{"row":48,"column":0},"action":"remove","lines":["  resources :imcos",""]},{"start":{"row":48,"column":0},"end":{"row":49,"column":0},"action":"insert","lines":["  resources :imcos",""]}]}],[{"group":"doc","deltas":[{"start":{"row":56,"column":47},"end":{"row":57,"column":0},"action":"insert","lines":["",""]},{"start":{"row":57,"column":0},"end":{"row":57,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":57,"column":2},"end":{"row":57,"column":47},"action":"insert","lines":["resources :inspections, only: [:index, :show]"]}]}],[{"group":"doc","deltas":[{"start":{"row":57,"column":26},"end":{"row":57,"column":30},"action":"remove","lines":["only"]},{"start":{"row":57,"column":26},"end":{"row":57,"column":27},"action":"insert","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":57,"column":27},"end":{"row":57,"column":28},"action":"insert","lines":["x"]}]}],[{"group":"doc","deltas":[{"start":{"row":57,"column":28},"end":{"row":57,"column":29},"action":"insert","lines":["c"]}]}],[{"group":"doc","deltas":[{"start":{"row":57,"column":29},"end":{"row":57,"column":30},"action":"insert","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":57,"column":30},"end":{"row":57,"column":31},"action":"insert","lines":["p"]}]}],[{"group":"doc","deltas":[{"start":{"row":57,"column":2},"end":{"row":57,"column":48},"action":"remove","lines":["resources :inspections, excep: [:index, :show]"]}]}],[{"group":"doc","deltas":[{"start":{"row":57,"column":0},"end":{"row":57,"column":2},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":56,"column":47},"end":{"row":57,"column":0},"action":"remove","lines":["",""]}]}]]},"ace":{"folds":[],"scrolltop":344.5,"scrollleft":0,"selection":{"start":{"row":48,"column":18},"end":{"row":48,"column":18},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":20,"state":"start","mode":"ace/mode/ruby"}},"timestamp":1420759523519}