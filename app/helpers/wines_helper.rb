module WinesHelper
    def country_user_wines(wine_array)
        wine_array.where(country_id: @country.id, user_id: @current_user.id)
    end

    def wine_category_array
        array = [ 'Cabernet Sauvignon', 'Other', 'Merlot', 'Pinot Noir', 'Zinfandel', 'Sauvignon Blanc', 'Riesling', 'Gewürztraminer', 'Chablis', 'Chardonnay', 'Chenin Blanc', 'Pinot Grigio', 'Rosé', 'Champagne', 'Prosecco', 'Brut', 'Grenache', 'Malbec', 'Syrah', 'Moscato', 'Traminer', 'Sauternes', 'Brachetto d’Acqui', 'Lambrusco', 'Port', 'Shiraz', 'Black Muscat', 'Moscato d Asti', 'Ice Wine', 'Sherry', 'Madeira']
        array.sort!
    end

end
