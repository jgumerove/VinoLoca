class SessionsController < ApplicationController

    def login #this is acting as the new method??
    end

    def create
        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user
        else
            flash[:errors] = ["Invalid username or password"]
            redirect_to login_path
        end
    end

    def home #not sure may delete
    end

    def logout
        session.clear
        redirect_to signup_path
    end

end
