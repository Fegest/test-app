Rails.application.routes.draw do

  root 'posts#index', as: 'home'

  get 'about' => 'pages#about'
  get 'posts/work' => 'posts#work'

  resources :posts

end
