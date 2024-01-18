Rails.application.routes.draw do
  get 'rooms/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  
  get 'posts/wave' => 'posts#wave'
  get 'posts/straight' => 'posts#straight'
  get 'posts/natural' => 'posts#natural'
  get 'posts/humei' => 'posts#humei'

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :users, :only => [:index, :show]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show]

end
