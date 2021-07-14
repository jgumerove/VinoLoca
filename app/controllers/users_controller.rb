class UsersController < ApplicationController

    def new #loading the singup form
        @user = User.new
    end

    def create #signup 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to countries_path #may change this redirect / currently shows list of all the countries 
        else 
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private 

    def user_params 
        params.require(:user).permit(:username, :email, :password)
    end

end
