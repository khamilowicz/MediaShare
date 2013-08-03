MediaShare::Application.routes.draw do
  devise_for :users,  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :users

  resources :media


  root to: "media#index" 
end
