DraftDay::Application.routes.draw do
  # get "leagues/new"
  devise_for :users
  # resources :users
  resources :sessions, only: [:new, :create, :destroy]
  # get "users/new"
  root to: 'static_pages#home'
  resources :users, only: [:show]
  resources :leagues
  resources :predraft_rankings, only: [:edit]
  # resources :projections, only: [:create]

  get "static_pages/home"
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  # get '/signup', to: 'users#new'
  # get '/signin', to: 'sessions#new'
  post '/sessions/user', to: 'sessions#create'
  # delete '/signout', to: 'sessions#destroy'
  # get '/leagues', to: 'leagues#new'
  # post '/leagues', to: 'leagues#create'
  post '/users/new', to: 'users#create'
  post '/leagues/new', to: 'leagues#create'
  post '/leagues/:id/edit', to: 'leagues#update', as: :update_league
  delete 'leagues/:id', to: 'leagues#destroy', as: :delete_league
  post 'predraft_rankings/:id', to: 'predraft_rankings#show', as: :update_rankings
  post 'leagues/:id/draft', to: 'projections#show', as: :draft
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
