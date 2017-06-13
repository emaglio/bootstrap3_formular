Rails.application.routes.draw do
  root to: 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :users
  end
  resources :users
  resources :sessions

end
