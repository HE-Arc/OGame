Rails.application.routes.draw do

  get 'laboratory' => 'laboratory#index'
  post 'laboratory/buy' => 'laboratory#buy'

  get 'home/index'

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

  controller :planets do
    get 'planet' => :planet
  end

  root 'home#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
