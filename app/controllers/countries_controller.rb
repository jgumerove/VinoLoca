class CountriesController < ApplicationController

    def index
        @current_user = current_user
        @countries = current_user.countries.alpha_country
    end

    
end
