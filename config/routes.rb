MediaShare::Application.routes.draw do
  devise_for :users
  
  resources :users

  resources :media


  root to: "media#index" 
end
