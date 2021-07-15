class WinesController < ApplicationController

    
    def new
        if params[:country_id] && country = Country.find_by(params[:country_id])
        @wine = country.wines.build
        else
            @wine = Wine.new
            @wine.build_country
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
        @country = Country.find(params[:country_id])
        @wines = @country.wines
   end

    def show
        set_wine
    end

    private 

    def set_wine
        @country = Country.find(params[:country_id])
        @wine = Wine.find(params[:id])
        if !@wine
            redirect_to countries_path #note we will change this
        end
    end

    def wine_params
        params.require(:wine).permit(:title, :category, :year, :rating, :price, :country_id)
    end


end
