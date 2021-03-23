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
end
