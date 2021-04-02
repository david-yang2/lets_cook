Rails.application.routes.draw do
  root to: "static_pages#root"
  
  resources :menus do
    resources :items, only: [:index, :new]
  end

  resources :items, only: [:create, :show, :update, :destory, :edit]

  resources :users


  resource :session, only: [:create, :destroy]
  
end
