Rails.application.routes.draw do
  root 'init_pages#index'
  get 'init_pages/login'
  get 'init_pages/new_acount'
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
