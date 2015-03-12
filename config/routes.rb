Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'static_pages#home'


  resources :users, only:[:show]
  resources :notifications, only: [:index, :show]
  resources :sessions, only: [:create, :destroy]
  resources :posts
  resources :comments, only: [:create, :destroy, :edit]
  resources :tags, only: [:index, :show]
  resources :follows, only: [:create, :destroy]
  resources :books, only: [:index, :new, :create, :show, :update, :destroy]
  resources :activities, only: [:litsoc, :techsoc, :schroeter]

  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/solved', to: 'posts#solved', via: 'get'
  match '/search', to: 'posts#search', via: 'get'
  match '/get_file', to: 'posts#get_file', via: 'get'
  match '/information', to: 'static_pages#information', via: 'get'
  match '/facilities', to: 'static_pages#facilities', via: 'get'
  match '/activities', to: 'static_pages#activities', via: 'get'
  match '/profile', to: 'users#home', via: 'get'
  match '/activities/litsoc', to: 'activities#litsoc', via: 'get'
  match '/activities/techsoc', to: 'activities#techsoc', via: 'get'
  match '/activities/schroeter', to: 'activities#schroeter', via: 'get'

  #get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/contact'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  #
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
