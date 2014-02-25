PostitTemplate::Application.routes.draw do
  #root to: 'posts#index'
  resources :posts, only: [:index, :new, :create, :update, :show, :edit]
end
