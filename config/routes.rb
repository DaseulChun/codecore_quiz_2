Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'ideas#index'
  
  resources :ideas do
    resources :reviews, only: [:create, :destroy], shallow: true
    resources :likes, shallow: true, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]
  
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
end
