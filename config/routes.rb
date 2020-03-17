Rails.application.routes.draw do
  get 'meals/create'
  root 'init_pages#index'
  get 'login' , to: 'init_pages#new'
  post 'login', to: 'init_pages#login'
  get '/logout',to: 'init_pages#destroy'
  get '/home', to: 'diet#home'
  resources :users
  resources :meals, only: [:create] 
  resources :diet, only: [:create] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
