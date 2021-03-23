class ItemsController << ApplicationController

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
      render json: toy.errors.full_messages, status: :unprocessable_entity
    end

  end
  def create
    item = Item.new(self.item_params)

    if item.save
      render json: item
    else
      render json: toy.errors.full_messages, status: :unprocessable_entity
    end
  end

  protected
  def item_params
    self.params[:item].permit(:menu_id, :name, :ingredients)
  end

end
