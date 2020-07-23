Rails.application.routes.draw do

  resources :friendships
  resources :birds do
    resources :comments
  end

  root to: 'pages#home'
  devise_for :users

  resources :users do
    member do
      get 'friends'
      get 'find_friends'
    end
  end
end
