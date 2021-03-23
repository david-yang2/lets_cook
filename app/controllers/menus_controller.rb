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

  #dn New action
  #dn steps to creating a new menu
  #dn 1. GET /menus/new to fetch a form                 1st HTTP Request
  #dn 2. User fills out form, clicks submit
  #dn 3. POST /menus the data in the form               2nd HTTP Request
  #dn 4. Create action is invoked, menu is created
  #dn 5. Send client a redirect to /menus/#{id}
  #dn 6. Client makes a Get request for /menus/#{id}    3rd HTTP Request
  #dn 7. Show action for newly created menu is invoked
  def new
    #dn /menus/new
    #dn show a form to create a new object

    render :new

  end

  def create

    #dn take the new inputs for menu and pass it into a new menu
    #dn create a new menu with the hash from the request
    #dn permit attributes listed in menu_params, anything else will be ignored
    @menu = Menu.new(self.menu_params)

    if @menu.save
      render json: menu
    else
      #dn gives the user a nice message of what went wrong
      render json: menu.errors.full_messages, status: unprocssable_entity
    end


  end

  def edit

    #dn /menus/:id/edit
    #dn show a form to edit an existing object
  end

  def show

    #dn find a specic menu with the menu ID given in the url
    @menu = Menu.find(params[:id])

    #render /menus/show.html.erb
    render :show
  end

  def update

    #update the Menu with ID given in the url

    # @menu = Menu.find_by(id: params[:id])
    #dn find the menu we are talking about
    @menu = Menu.find(params[:id])

    #dn update with the given hash, but only the ones we permit
    #dn anything else will be ignored
    menu.update(self.menu_params)
  end

  #dn Destroy action
  #dn 1. GET /menus
  #dn 2. Click delete button (in index.html.erb)
  #dn 3. Sends POST /menus/id; but _method="DELETE" so rails understands
  #      to do a destory
  #dn 4. Destorys the cat. Issues a redirect to the Client
  #dn 5. Client gets /menus again
  def destroy
    #dn find the menu with the given ID and destory it
    menu = Menu.find(params[:id])
    menu.destroy

    #dn once deleted redirect to menu index
    #dn menus_url is a url helper method
    #dn menus_url == http://localhost:3000/menus
    redirect_to menus_url
  end

  protected
  def menu_params
    #dn typically used in create and update
    #dn if you create an object, you should be able to update the same parameters

    #dn params[:menu] receive what ever hash that was passed in
    #dn .permit will only permit the attributes in the () when creating/updating
    #dn anything else will be ignored
    self.params[:menu].permit(:chefs_name)
  end


end
