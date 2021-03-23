class ItemsController < ApplicationController

  def index
    #dn /menu/:menu_id/items
    #dn :menu_id is part of the path that the route matches
    #dn although this is the item controller, you can still find the menu with the
      #dn given ID in the URL

    #dn menu.items will only index the items of the given menu
    render json: menu.items
  end

  def show


    render json: Item.find(self.params[:id])
  end


  def destory
    #dn /items/:id
    item = Item.find(params[:id])
    item.destory
    render json: item
  end

  def update

    #dn /items/:id
    item = Item.find(params[:id])

    success = item.update(self.item_params)
    if success
      render json: item
    else
      render json: item.errors.full_messages, status: :unprocessable_entity
    end

  end

  def create
    @item = Item.new(self.item_params)

    #dn can do this because there's an association between them
      #dn can't do @menu = params[:menu_id] eventhough we are in /menus/:menu_id/items/new
        #dn since it POST to /items -> top level resource
      #dn menu_id actually lives in the item parameter
        #dn -> @item.menu == Menu.find(params[:item][:menu_id])

    @menu = @item.menu

    if @item.save

      #dn redirect to /menus/:menu_id
      redirect_to menu_url(@menu)
    else
      render :new
      #render json: item.errors.full_messages, status: :unprocessable_entity
    end
  end

  def new
    @menu = Menu.find(params[:menu_id])
    @item = Item.new
    render :new
  end

  protected
  def item_params
    self.params[:item].permit(:menu_id, :name, :ingredients, :dish_type)
  end

end
