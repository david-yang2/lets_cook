class UsersController < ApplicationController
    def create
        @user = User.new(user_params)

        if @user.save
            render json: @user
        else 
            render json: @user.errors.full_messages
        end
    end


    def new
        @user = User.new
    end

    def self.find_by_credentials(username,password)
        user = User.find_by(username: username)
        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end
    private

    def user_params
        #dn notice we are calling .permit with :password, NOT password_digest
        #dn mass-assignment will call the setter method password=
        params.require(:user).permit(:username, :password)
    end
end