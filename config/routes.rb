Rails.application.routes.draw do

  
  get 'session/new'
  get 'session/create'
  get 'session/update'
  get 'session/edit'
  get 'session/show'
  get 'users/new'
  get 'users/create'
  get 'users/update'
  get 'users/edit'
  get 'users/show'
  resources :bills
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
