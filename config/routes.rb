Rails.application.routes.draw do

  resources :birds do
    resources :comments
  end

  root to: 'pages#home'
  devise_for :users

  resources :users do
    member do
      get 'myfeed'
    end
  end
  
end
