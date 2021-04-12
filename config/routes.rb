Rails.application.routes.draw do
  root :to => 'bills#new'


  resources :session, :only => [:create, :destroy, :new]
  get "logout" => "session#destroy", :as => "logout"
  get "login" => "session#new", :as => "login"

  resources :users, :except => [:destroy, :index]
  # get '/:id' => 'users#show', :as => :user

  resources :bills
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
