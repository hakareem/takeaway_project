
require "menu"
require "dish"

class Interface
 def initialize(io,order)
  @io = io
  @order = order
 end

 def run 
  show "Welcome to TP"
  name = prompt "Can I start with your name?"
  show "Welcome #{name}, Here is our menu:\n#{menu}"
  choice = prompt "Please select a dish by typing it's name: "
  show "Great! we'll have #{choice} ready for you."
  further = prompt "Is there anything else you would like to order? Y/N"
  if further == "Y" || further == "y"
   show "Get out!"
  elsif further == "N" || further == "n"
   show "It was a pleasure serving you"
  else
   show "HUH?"
   prompt "Is there anything else you would like to order? Y/N"
  end
 end

  private 

  def show(message)
   @io.puts(message)
  end


  def prompt(message)
   @io.puts(message)
   return @io.gets.chomp
  end

  def menu
   menu = Menu.new
   dish1 = Dish.new('Chicken', 10)
   dish2 = Dish.new('Burger', 20)
   dish3 = Dish.new('Pizza', 30)
   menu.add_dish(dish1)
   menu.add_dish(dish2)
   menu.add_dish(dish3)
   return menu.format
  end

 end