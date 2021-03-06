Library::Application.routes.draw do
  get "cart/index"

  opinio_model

  resources :book_lists do
    opinio
  end


  resources :reviews do
    opinio
  end


  get "profiles/show"
  get "welcome/home"
  get "authors/search_author"
  get "authors/author_information"
  get "cart/index"


  resources :updates do
    opinio
  end


  resources :books do
    opinio
  end


  devise_for :users

  # http://teamtreehouse.com/library/building-social-features-in-ruby-on-rails-2/building-the-friendship-ui/creating-the-friendship-controller
  resources :user_friendships

  # http://teamtreehouse.com/library/build-a-simple-ruby-on-rails-application/building-the-profile-page/testing-the-profiles-controller-2
  get '/:id', to: 'profiles#show', :as => :profile

  # Routing for custom gem
  match '/validate', :controller=>'authors', :action=>'author_information'

  # Cart Routing
  match '/cart', :controller=>'cart', :action=>'index'
  match '/cart/:id', :controller=>'cart', :action=>'add'



  # The priority is based upon order of creation:
  # first created -> highest priority.

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
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
