module WinesHelper
    def country_user_wines(wine_array)
        wine_array.where(country_id: @country.id, user_id: @current_user.id)
    end
end
