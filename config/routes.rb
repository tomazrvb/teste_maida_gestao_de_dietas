Rails.application.routes.draw do
  get 'weight_histories/dash'
  get 'meals/create'
  root 'init_pages#index'
  get 'login' , to: 'init_pages#new'
  post 'login', to: 'init_pages#login'
  get '/logout',to: 'init_pages#destroy'
  get '/home', to: 'diet#home'
  resources :users
  resources :meals, only: [:create,:destroy] 
  resources :diet, only: [:create,:destroy] 
  resources :weight_histories, only: [:create,:destroy] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
