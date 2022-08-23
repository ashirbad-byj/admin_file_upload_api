Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :myfiles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  get "/api/v1/myfiles/:id", to: "myfiles#getFile"

  post "/api/v1/myfiles/", to: "myfiles#addFile"

  delete "/api/v1/myfiles/:id", to: "myfiles#deleteFile"

  patch "/api/v1/myfiles/:id", to: "myfiles#editFile"

end
