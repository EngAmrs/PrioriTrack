Rails.application.routes.draw do
  resources :tasks, except: [:index, :show, :new] do
    collection do
      get 'index_json'
    end
  end
  resources :projects
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/webapp', to: 'web_app#index'
  # Defines the root path route ("/")
  root "application#index"
end
