Paveque::Application.routes.draw do



  get "manmedals/new"
  get "manmedals/create"
  get "manmedals/edit"
  get "manmedals/show"
  get "dragonmedals/new"
  get "dragonmedals/create"
  get "dragonmedals/edit"
  get "dragonmedals/show"
  devise_for :users
  
resources :men do
  get 'practice', :on => :member
end

resources :dragons do
  get 'practice', :on => :member
  get 'fight'   , :on => :member
  get 'choose'  , :on => :member
  get 'engage'  , :on => :member
end

resource :user, except: [:index, :destroy, :new, :create] do
  get 'sidebar'
  resources :men,     only: [] do
    collection do
      get 'my_men'
    end
  end
  resources :dragons, only: []   
end

devise_scope :user do
  root to: "devise/sessions#new"
end

resources :dragonmedals, only: [:create, :show]
resources :manmedals,    only: [:create, :show]







  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
