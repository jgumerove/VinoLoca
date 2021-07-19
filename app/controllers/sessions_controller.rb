class SessionsController < ApplicationController

    skip_before_action :authorized, only: [:login, :create, :home, :google_omniauth]

    def login 
    end

    def create
        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to countries_path 
        else
            flash[:errors] = ["Invalid username or password"]
            redirect_to login_path
        end
    end

    def home 
    end

    def logout
        session.clear
        redirect_to login_path 
    end

    def google_omniauth
        user_info = request.env['omniauth.auth']['info']
        user = User.find_or_create_from_google(user_info)
        if user
            session[:user_id] = user.id
            redirect_to countries_path
        else
            flash[:errors] = user.errors.full_messages
            redirect_to login_path
        end
    end

end
