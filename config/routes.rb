PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  resources :posts, except: [:destroy] do
  	member do
  	  post 'vote' # /posts/id/vote
  	end
  	resources :comments, only: [:create] do
  	  member do
  	  	post 'vote'
  	  end
  	end
  end
  resources :categories, only: [:new, :create, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/register', to: 'users#new'

  resources :users, only: [:update, :create, :show, :edit]
end
