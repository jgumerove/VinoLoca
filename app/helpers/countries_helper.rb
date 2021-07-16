module CountriesHelper
    def user_country_wine_count(country)
        country.wines.where(user_id: @current_user.id).count
    end
end
