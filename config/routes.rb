SENG515::Application.routes.draw do
  

  devise_for :users, :path => "accounts", :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }

  namespace :admin do
    resources :equipment
    resources :rooms
    resources :users, only: [:index, :destroy] do
      member do
        post :promote
        post :demote
      end
    end
    resources :budgets, only: :index
  end
  resources :workshops do
    resources :sessions do
      member do
        post :register
        post :unregister
      end
    end
    resource :budget, only: [:edit, :update]
  end
  resources :users, only: :show
  resources :rooms, only: :index
  resources :posts, :path => "blog/posts"
  
  root to: 'home#index'


  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
