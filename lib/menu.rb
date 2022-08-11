class Menu
   def initialize()
      @dishes = []
   end

   def add_dish(dish)
      fail "Invalid data type" unless dish.name.is_a?(String) && dish.price.is_a?(Integer)
      @dishes << dish
   end

   def remove_dish(dish)
      @dishes.delete(dish)
   end

   def format
      @dishes.map { |dish| "#{dish.name} : £#{dish.price}"}.join("\n")
   end

   def get_menu
      @dishes
   end
end