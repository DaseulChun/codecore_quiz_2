Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'ideas#index'
  resources :ideas do
    resources :reviews, only: [:create, :destroy], shallow: true
  end
end
