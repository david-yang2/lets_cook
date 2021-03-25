=begin dn

Action controllers are the core of web request in Rails
  made up of one or more actions that are executed on request and then either
    - renders a template
    - redirects to another action (public method on the controller)

By default, only the ApplicationController in a Rails app inherits from ActionController::Base

All other controllers inherit from ApplicationController

=end

class ApplicationController < ActionController::Base
  #dn if you set a filter here, it will run on every controller in your application
  #dn  provides our controllers with handy methods


  #dn helper_method allows us to use the methods through out any view pages
  #dn make current_user available in all views
  helper_method :current_user

  def login!(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end


  # protect_from_forgery with: :null_session
end
