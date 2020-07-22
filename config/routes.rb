Rails.application.routes.draw do
  get 'birds/myshow'
  resources :birds
  root to: 'pages#home'
  devise_for :users
  
end
