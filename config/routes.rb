MediaShare::Application.routes.draw do
  devise_for :users
  
  resources :users

  resources :media

  get '/auth/:provider/callback' => 'session#create'


  root to: "media#index" 
end
