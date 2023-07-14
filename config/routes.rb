Rails.application.routes.draw do
  resources :projects
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/webapp', to: 'web_app#index'
  # Defines the root path route ("/")
  root "application#index"
end
