Rails.application.routes.draw do


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :menus do

    #dn these are the routes you want to be nested under menus
      #dn e.g. /menus/:menus_id/items
    resources :items, only: [:index, :new]
  end

  #dn make some top level resources for items
    #dn these actions will work with /items/:id
  #dn when you are creating, showing, updating, destory a SINGLE item,
    #dn it makes more sense that is on the top-level
  resources :items, only: [:create, :show, :update, :destory]

  resources :users


  #dn no Session model class, nor sessions table
#dn session resource is singular because the user will only use at most one session: their own
  resources :session


  #dn instead of the default Rails page, redirect us /menus
  #dn essentiall changing the root too /menus
  root to: redirect("/menus")
end
