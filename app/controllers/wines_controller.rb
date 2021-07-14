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

    private 

    def wine_params
        params.require(:wine).permit(:title, :category, :year, :rating, :price, :country_id)
    end


end
