Rails.application.routes.draw do
  root "application#index"
  devise_for :users
  get '/webapp', to: 'web_app#index'


  # Projects Routes
  resources :projects

  # Tasks Routes
  resources :tasks, except: [:index, :show, :new] do
    collection do
      get 'index_json'
    end
  end
  #Search
  get 'tasks/search', to: 'tasks#search'
end
