Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  resources :users, only: [:new, :create, :show] do
    resources :ideas, only: [:index, :show, :new, :create, :destroy]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/categories', to: 'categories#index'



  namespace :admin do
    resources :categories
  end
end
