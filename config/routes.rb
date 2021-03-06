Rails.application.routes.draw do
  # root to: "static_pages#root", as: :root
  root to: redirect("/static_pages")
  resources :static_pages, only: [:index]
  
  namespace :api, defaults: {format: :json} do
    resources :items, only: [:create, :show, :update, :destory]

    resources :users


    resource :session, only: [:create, :destroy]
    resources :menus, except: [:new, :edit] do
      resources :items, only: [:index]
    end


  end
  
end
