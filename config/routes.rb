Rails.application.routes.draw do
  resources :birds
  root to: 'pages#home'
  devise_for :users
  
end
