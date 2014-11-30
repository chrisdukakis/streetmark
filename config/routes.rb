Rails.application.routes.draw do

  get 'important/index'

  get 'comment/create'

  get 'comment/delete'

  get 'user/index'

  root 'home#index'

  get 'home' => 'home#index'

  get 'important' => 'important#index'
  
  get 'report' => 'post#create'

  post 'report' => 'post#create'

  get 'users/:id' => 'user#index'

  get 'map' => 'post#map'

  get 'posts' => 'home#index'

  get 'posts/:id' => 'post#index'

  post 'posts/:id' => 'comment#create'

  post 'highlight/:id' => 'post#highlight'

  devise_for :users
  devise_scope :user do
    get 'sign_in' => 'devise/sessions#new'
    get 'sign_up' => 'devise/registrations#new'
    get 'sign_out' => 'devise/sessions#destroy'
    get 'reset_password' => 'devise/passwords#new'
    post 'sign_in' => 'devise/sessions#create'
    post 'sign_up' => 'devise/registrations#create'
  end

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