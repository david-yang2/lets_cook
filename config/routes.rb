Rails.application.routes.draw do
  root to: "static_pages#root"
  
  namespace :api, defaults: {format: :json} do
    resources :items, only: [:create, :show, :update, :destory, :edit]

    resources :users


    resource :session, only: [:create, :destroy]
    resources :menus do
      resources :items, only: [:index, :new]
    end


  end
  
end
