Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  namespace :api do
    namespace :v1 do
    
      post 'user', to: 'user/session#create'
      resources :products
      post 'add_cart/:id', to: 'products#add_cart'
      post 'checkout', to: 'products#checkout'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
