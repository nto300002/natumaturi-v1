Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :flyers do
    resources :comments, only: [:create, :destroy]
    resources :bookmarks, only: [:create, :destroy]
  end
  
  root to: 'tops#top' # Home page to display list of flyers

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  post 'uploads/:model/:mounted_as/:id/:filename', to: 'uploads#show', as: 'upload'
end
