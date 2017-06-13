Rails.application.routes.draw do
  root to: 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :posts
  end

  resources :sessions do
    collection do
      get 'sign_out'
    end
  end
end
