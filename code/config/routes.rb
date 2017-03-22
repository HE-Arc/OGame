Rails.application.routes.draw do

  get 'home/index'

  #get 'admin/index'
  #get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users

  get 'admin' => 'admin#index'

  get 'planets' => 'planet#index'
  get 'planets/:id' => 'planet#show'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    get 'logout' => :destroy
  end

  controller :home do
    get 'home' => :home
  end

  root 'home#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
