
class Api::MenusController < ApplicationController
  #before_action :require_current_user!, except: [:index, :show]

  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      render :show
    else
      render json: @menu.errors.full_messages, status: 422
    end
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      render :show
    else
      render json: @menu.errors.full_messages, status: 422
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    if @menu.destory
      render :show
    else 
      render json: @menu.errors.full_messages, status: 422
    end
  end

  private
  def menu_params
    params.require(:menu).permit(:chefs_name, :location)
  end
end





# not sure if i need yet

# def new
#   #dn /menus/new
#   #dn show a form to create a new object
#     #dn think of it as a proxy, so that we can use menu attributes ->
#       #dn @menu.chefs_name,@menu.location in the form file
#   @menu = Menu.new
#   render :new

# end



# #dn 1. find the menu
# def edit

#   #dn /menus/:id/edit
#   #dn show a form to edit an existing object

#   @menu = Menu.find(params[:id])
#   render :edit
# end

