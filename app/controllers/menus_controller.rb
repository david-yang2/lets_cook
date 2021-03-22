#dn in this file will be our ruby code on how to process the requests
class MenusController < ApplicationController


  def index
    #dn GET /menus
    #dn create instance variables in the controller, so it can be used in views files
    #dn remember local variables, regular menu, will not be accessible in the views
    @menu = Menu.all

    #dn when the router calls the index action/method, send it back index.html.erb
    #dn rails knows the symbol index (:index) refers to menus/index.html.erb
    render :index

  end

  #dn steps to creating a new menu
  #dn 1. GET /menus/new to fetch a form
  #dn 2. User fills out form, clicks submit
  #dn 3. POST /menus the data in the form
  #dn 4. Create action is invoked, menu is created
  #dn 5. Send client a redirect to /menus/#{id}
  #dn 6. Client makes a Get request for /menus/#{id}
  #dn 7. Show action for newly created menu is invoked
  def new
    #dn /menus/new
    #dn show a form to create a new object

    render :new

  end

  def create

    # @menu = Menu.new(params[:menu].permit(:label))
    #
    # if @menu.save
    #   #dn


  end

  def edit

    #dn /menus/:id/edit
    #dn show a form to edit an existing object
  end

  def show

    #dn find a specic menu with the menu ID given in the url
    @menu = Cat.find(params[:id])
    render :show
  end

  def update

    #update the Menu with ID given in the url

    @menu = Menu.find_by(id: params[:id])
  end

  def destroy
  end

end
