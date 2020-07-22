Rails.application.routes.draw do
  get 'birds/myshow'
  resources :birds do
    resources :comments
    end
  root to: 'pages#home'
  devise_for :users
  
end
