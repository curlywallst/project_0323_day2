class Cli
    def run
        puts " "
        puts "Hello and welcome to my BARTENDING APP!"
        puts " "
        puts "Enter an ingredient to see drinks made with it"
        puts " "
        @ingredient = gets.strip.downcase
        Api.get_drinks(@ingredient)
        print_drinks(Drink.all)
        prompt
        input = gets.strip.downcase
        while input != 'exit'
            if input == 'list'
                print_drinks(Drink.find_by_ingredient(@ingredient))
            elsif input.to_i > 0 && input.to_i <= Drink.find_by_ingredient(@ingredient).length
                drink = Drink.find_by_ingredient(@ingredient)[input.to_i-1]
                Api.get_drink_details(drink) if !drink.instructions
                print_drink(drink)
            elsif input == "ingredient"

            else
                puts "I do not understand - please try again"
                puts " "
            end
            prompt
            input = gets.strip.downcase
        end
        puts " "
        puts "Bye!"
    end

    def print_drinks(drinks)
        puts " "
        puts "Here are the drinks made with #{@ingredient}:"
        puts " "
        drinks.each.with_index(1) do |drink, index|
            puts "#{index}. #{drink.name}"
        end
    end

    def print_drink(drink)
        puts drink.name
        puts drink.instructions
    end

    def prompt
        puts " "
        puts "Select a number to see the recipe, type 'list to see the list again, 'ingredient' to select a new ingredient or 'exit to exit"
        puts " "
    end
end