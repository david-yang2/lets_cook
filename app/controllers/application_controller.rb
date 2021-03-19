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
end
