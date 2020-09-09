class UsersController < ApplicationController
    before_action :require_logged_in, except: [:new, :create]

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:user_name, :password, :password_digest, :session_token)
    end
end
