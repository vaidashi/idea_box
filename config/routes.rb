Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  resources :users, only: [:new, :create, :show] do
    resources :ideas
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/categories', to: 'categories#index'


  resources :images, only: [:index]



  namespace :admin do
    resources :categories
    resources :images, only: [:index, :new, :create, :destroy]
  end
end
