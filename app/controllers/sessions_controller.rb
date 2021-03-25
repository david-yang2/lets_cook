#dn even when using a singular resource, controllers are always pluralized

#dn this controller will verify a user's credentials
class SessionsController < ApplicationController
    def create
        user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )

        if user.nil?
            render json: 'Credentials were wrong'
        else
            #dn since SessionsController inherits from ApplicationController
            #dn we can use any methods defined in ApplicationController
            login!(user)
            render json: "Welcome back #{user.username}!"
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end
  
    def new
    end
end