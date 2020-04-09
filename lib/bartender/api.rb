class Api

    def self.get_drinks(ingredient)
        url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"
        response = Net::HTTP.get(URI(url))
        drinks = JSON.parse(response)["drinks"]

        drinks.each {|d| Drink.new(name: d["strDrink"], drink_id: d["idDrink"], ingredient: ingredient)}
    end

    def self.get_drink_details(drink)
        url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{drink.drink_id}"
        response = Net::HTTP.get(URI(url))
        data = JSON.parse(response)["drinks"]
        drink.instructions = data[0]["strInstructions"]
        binding.pry
    end
end