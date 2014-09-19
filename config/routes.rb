Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/railsadmin', as: 'rails_admin'
  
  devise_for :users
  #"resources :users" uses devise users model and implements an own controller and show pages
  resources :users, only: [:index, :show, :destroy]
  get "users/:id/lock_user" => 'users#lock_user', as: 'lock_user'

  get 'pages/info'

  # resources :admin do
  #   resources :ideas
  #   resources :users
  # end

  resources :ideas do
    resources :comments#, only: [ :create, :destroy ]#später: edit, update wenn nutzerspezifische Kommentare möglich
  end

  root to: redirect('ideas')
  
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



#  map.connect '*path', controller: 'main', action: 'redirect_to_default'
# get "//*//", to: redirect('ideas')

end
