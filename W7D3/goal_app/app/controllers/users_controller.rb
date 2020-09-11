class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def index
        @users = User.all 
        render :index
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    def edit
        @user = User.find(params[:id])
        render :edit
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    def update
        @user = User.find_by(id: params[:id])
        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end