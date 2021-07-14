class WinesController < ApplicationController

    def new
        @wine = Wine.new
    end

    def create
        @wine = current_user.wines.build(wine_params)
        if @wine.save
            redirect_to wine_path(@wine)
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
        @wine = Wine.find(params[:id])
        if !@wine
            redirect_to countries_path #note we will change this
        end
    end

    def wine_params
        params.require(:wine).permit(:title, :category, :year, :rating, :price, :country_id)
    end


end
