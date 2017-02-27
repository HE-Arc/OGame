Rails.application.routes.draw do

  get 'home/index'

  root 'home#index'

  #get 'admin/index'
  #get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users

  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
