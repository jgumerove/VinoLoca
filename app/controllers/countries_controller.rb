class CountriesController < ApplicationController

    def index
        @countries = current_user.countries
    end
    
end
