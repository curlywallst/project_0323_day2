class Drink
    attr_accessor :name, :drink_id, :ingredient, :instructions
    @@all =[]

    def initialize(name:, drink_id:, ingredient:)
        @name = name
        @drink_id = drink_id
        @ingredient = ingredient
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_ingredient(ingredient)

        @@all.select {|d| d.ingredient == ingredient}
    end

end