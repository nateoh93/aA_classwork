class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user
    skip_before_action :verify_authenticity_token

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_logged_in
        unless logged_in?
            render json: ["invalid"], status: 401
        end
    end

    def logged_in?
        !!current_user
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil
        @current_user = nil
    end
end