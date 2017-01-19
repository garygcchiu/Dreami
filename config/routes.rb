Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index', as: 'home'


  get 'about' => 'pages#about', as: 'about'



  resources :posts do
    resources :comments
  end

end
