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
        end
   end

    def show
        @wine = Wine.find(params[:id]) 
        redirect_to countries_path if @wine.user != current_user
        @country = Country.find(params[:country_id])  
    end

    def destroy
        @country = Country.find(params[:country_id])
        @wine = Wine.find(params[:id])
        @wine.destroy
        redirect_to country_wines_path(@country)
    end

    private 

    #def set_wine   
    #end

    def wine_params
        params.require(:wine).permit(:title, :category, :year, :rating, :price, :country_id)
    end


end
