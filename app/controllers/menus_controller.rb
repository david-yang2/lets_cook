#dn in this file will be our ruby code on how to process the requests
class MenusController < ApplicationController
  #before_action :require_current_user!, except: [:index, :show]

  def index
    #dn GET /menus
    #dn create instance variables in the controller, so it can be used in views files
    #dn remember local variables, regular menu, will not be accessible in the views
    @menus = Menu.all

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
      #dn think of it as a proxy, so that we can use menu attributes ->
        #dn @menu.chefs_name,@menu.location in the form file
    @menu = Menu.new
    render :new

  end

  #dn 1. GET Request for blank /menu/new form
  #dn 2. POST to /cats
  #dn 3. Validation fails
  #dn 4. Server render new template again
  #dn 5. The form is filled in wioth @menu data

  def create

    #dn take the new inputs for menu and pass it into a new menu
    #dn create a new menu with the hash from the request
    #dn permit attributes listed in menu_params, anything else will be ignored
    @menu = Menu.new(self.menu_params)

    if @menu.save
      #dn menu_url is a url helper method
      #dn menu_url == http://localhost:3000/menus
      #dn so menu_url(@menu) == /menus/:id -> id of cat that was just created
        #dn => hits the show.html.erb

      redirect_to menu_url(@menu)
    else
      #dn if it doesn't save, it gives the user another chance to create a menu
        #dn by rendering the page again
      #dn you can redirect_to new_menu_url, however, all the values from the user will be lost
        #dn by rendering, you're allowing the user to save the inforatmion they inputted
        #dn and put it back into the form in new.html.erb so they can attempt to create again
      render :new


      # #dn gives the user a nice message of what went wrong
      # render json: @menu.errors.full_messages, status: :unprocssable_entity
    end
  end

  #dn 1. find the menu
  def edit

    #dn /menus/:id/edit
    #dn show a form to edit an existing object

    @menu = Menu.find(params[:id])
    render :edit
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
    #dn if that works:
    if @menu.update(self.menu_params)
      #redirect to /menus/:menu_id
      redirect_to menu_url(@menu)
    else

      #dn or ellse, render the edit page again so user can try to update again
      render :edit
    end
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
    redirect_to menu_url
  end

  protected
  def menu_params
    #dn typically used in create and update
    #dn if you create an object, you should be able to update the same parameters

    #dn params[:menu] receive what ever hash that was passed in
    #dn .permit will only permit the attributes in the () when creating/updating
    #dn anything else will be ignored
    self.params[:menu].permit(:chefs_name, :location)
  end


end
