class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?
    before_action :authorized

    

    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        redirect_to login_path unless logged_in?
    end


end
