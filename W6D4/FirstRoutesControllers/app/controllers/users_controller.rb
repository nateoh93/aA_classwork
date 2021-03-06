class UsersController < ApplicationController
    def index
        users = User.all

        render json: users
    end 

    def show
        user = User.find(params[:id])

        render json: user
        # render: show
    end

    def create
        user = User.new(user_params)
        if user.save
        # user.save!
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def update
        user = User.find(params[:id])
         if user.update(user_params)
            redirect_to user_url(user)
         else
            render json: user.errors.full_messages, status: 422
         end
    end


    def destroy
        user = User.find(params[:id]) 
        user.destroy
        render json: user
        
    end

    private   

    def user_params
        params.require(:user).permit(:username)
    end
end

# Params correspond to the request parameters that are appended to the request URL.they are most used with GET requests. On the other hand, Body is the actual request body (usually it defines the request payload or the data needs to be processed by the request). PUT and POST requests are usually read the data from the body of the request and not from the params.