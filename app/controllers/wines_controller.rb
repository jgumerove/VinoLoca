class WinesController < ApplicationController

    
    def new
        if params[:country_id] && @country = Country.find_by_id(params[:country_id])
            @wine = @country.wines.build
        else
            @wine = Wine.new
        end
    end

    def add
        @wine = Wine.new
    end

    def addition
        @wine = current_user.wines.build(wine_params)
        if @wine.save
            redirect_to country_wine_path(@wine.country, @wine)
        else
            render :add
        end
    end

    def create
        @wine = current_user.wines.build(wine_params)
        if @wine.save
            redirect_to country_wine_path(@wine.country, @wine)
        else
            render :new
        end
    end

    def index 
        if params[:country_id] && @country = Country.find_by_id(params[:country_id])
            @current_user = current_user
            @wines = @country.wines
        else    
          @wines = Wine.all
        end
   end

    def show
        set_wine
    end

    private 

    def set_wine
        @country = Country.find(params[:country_id])
        @wine = Wine.find(params[:id])
        if !@wine
            redirect_to countries_path 
        end
    end

    def wine_params
        params.require(:wine).permit(:title, :category, :year, :rating, :price, :country_id)
    end


end
