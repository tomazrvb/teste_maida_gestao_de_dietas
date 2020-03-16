Rails.application.routes.draw do
  root 'init_pages#index'
  get 'login' , to: 'init_pages#new'
  post 'login', to: 'init_pages#login'
  delete '/logout',to: 'init_pages#destroy'
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
