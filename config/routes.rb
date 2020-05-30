Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:       'admins/sessions'
  }

  devise_for :users, controllers: {
    sessions:       'users/sessions',
    registrations:  'users/registrations'
  }

  root to: 'user/surprises#index'


  namespace :admin do

    # users
    resources :users, only: [ :index, :show, :update ]
    patch  'users/:id/delete', to: 'users#destroy', as: 'user_delete'
    get    'user/delete_complete', to: 'users#destroy_complete', as: 'user_delete_complete'

    # surprises
    resources :surprises, only: [ :index, :show, :new, :update, :destroy ]
    get    'surprise/delete_complete', to: 'surprises#destroy_complete', as: 'surprise_delete_complete'

    # surprise_favorites
    get    'users/:user_id/surprise_favorites', to: 'surprise_favorites#index', as: 'surprise_favorites'

    # orders
    resources :orders, only: [ :index, :show, :destroy ]
    get    'admin/order/destroy_complete', to: 'orders#destroy_complete', as: 'order_delete_complete'

    # notices
    get    ':user_id/notices/new', to: 'notices#new', as: 'notices_new'
    get    ':user_id/notices', to: 'notices#index', as: 'notices'
    post   ':user_id/notices', to: 'notices#create', as: 'notices_create'
    get    'notices/:id', to: 'notices#show', as: 'notice'

    # reviews
    get    ':user_id/reviews', to: 'reviews#index', as: 'reviews'
    delete 'reviews/:id', to: 'reviews#destroy', as: 'reviews_delete'
    get    'review/delete_complete', to: 'reviews#destroy_complete', as: 'review_delete_complete'

    # cancel_requests
    resources :cancel_requests, only: [ :index, :show ]
    get    'cancel_requests/:id/reject', to: 'cancel_requests#reject'
  end


  scope module: :user do

    # users
    resources :users, only: [ :show ]
    get    'user/edit', to: 'users#edit', as: 'user_edit'
    patch  'user/edit', to: 'users#update'
    get    'user/delete', to: 'users#destroy_confirm', as: 'user_delete'
    patch  'user/delete', to: 'users#destroy'
    get    'user/delete_complete', to: 'users#destroy_complete', as: 'user_delete_complete'

    # surprises
    resources :surprises, only: [ :index, :create, :show, :new, :edit, :update, :destroy ]
    get    'surprises/delete_complete', to: 'surprises#destroy_complete', as: 'surprise_delete_complete'

    # surprise_favorites
    get    'users/:user_id/surprise_favorites', to: 'surprise_favorites#index', as: 'surprise_favorites'
    post   'users/:surprise_id/surprise_favorites', to: 'surprise_favorites#create'
    delete 'users/:surprise_id/surprise_favorites', to: 'surprise_favorites#destroy'

    # orders
    resources :orders, only: [ :show, :index, :create, :update ]
    get    ':surprise_id/orders/new', to: 'orders#new', as: 'order_new'
    post   'orders/new', to: 'orders#create_session', as: 'new_order'
    get    'order/confirm', to: 'orders#confirm', as: 'order_confirm'
    get    'order/complete', to: 'orders#complete', as: 'order_complete'

    # order_messages
    post   ':order_id/order_messages', to: 'order_messages#create', as: 'order_messages' 

    # addresses
    resources :addresses, only: [ :new, :edit, :index, :create, :update, :destroy ]

    # notices
    resources :notices, only: [ :index, :show, :update ]

    # relationships
    post   ':user_id/relationships', to: 'relationships#create', as: 'relationships'
    delete ':user_id/relationships', to: 'relationships#destroy'

    # reviews
    get    'reviews/:id', to: 'reviews#show', as: 'review'
    get    ':user_id/reviews', to: 'reviews#index', as: 'reviews'
    post   ':user_id/reviews', to: 'reviews#create'
    get    ':user_id/reviews/new', to: 'reviews#new', as: 'reviews_new'

    # cancel_requests
    get    ':order_id/cancel_requests/new', to: 'cancel_requests#new', as: 'cancel_requests_new'
    post   ':order_id/cancel_requests', to: 'cancel_requests#create', as: 'cancel_requests'
    get    'cancel_requests/success', to: 'cancel_requests#success', as: 'cancel_requests_success'
  end
end
