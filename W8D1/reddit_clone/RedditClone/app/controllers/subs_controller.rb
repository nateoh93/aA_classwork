class SubsController < ApplicationController
    before_action :require_logged_in

    def index
        @subs = Sub.all
        render :index
    end

    def create
        # @sub = current_user.sub_forums.new(sub_params) ---this also works (more implicit)
        @sub = Sub.new(sub_params)
        @sub.moderator_id = current_user.id
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def new
        @sub = Sub.new
        render :new
    end

    def edit
        @sub = Sub.find(params[:id])
        render :edit
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def update
        @sub = Sub.find(params[:id])
        if (@sub.moderator_id == current_user.id) && @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    private

    def sub_params
        params.require(:sub).permit(:description, :title)
    end
end
