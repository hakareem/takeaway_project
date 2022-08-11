require "menu"


RSpec.describe Menu do
 context "Adding dishes to the menu" do
  it "adds to the list" do
   menu = Menu.new
   dish1 = double :Dish, name: "dish1", price:  5
   dish2 = double :Dish, name: "dish2", price:  10
   dish3 = double :Dish, name: "dish3", price:  15
   menu.add_dish(dish1)
   menu.add_dish(dish2)
   menu.add_dish(dish3)
   expect(menu.get_menu).to eq [dish1, dish2, dish3]
  end
 end

 context "removing dishes from the menu" do
  it "removes the dish from the list" do
   menu = Menu.new
   dish1 = double :Dish, name: "dish1", price:  5
   dish2 = double :Dish, name: "dish2", price:  10
   dish3 = double :Dish, name: "dish3", price:  15
   menu.add_dish(dish1)
   menu.add_dish(dish2)
   menu.add_dish(dish3)
   menu.remove_dish(dish1)
   expect(menu.get_menu).to eq [dish2, dish3]
  end
 end

 context "trying to add dishes with invalid data type" do
  it "fails" do
   menu = Menu.new
   dish1 = double :Dish, name: "dish1", price:  "5"
   expect{menu.add_dish(dish1)}.to raise_error "Invalid data type"
   dish2 = double :Dish, name: nil, price:  10
   expect{menu.add_dish(dish2)}.to raise_error "Invalid data type"
   dish3 = double :Dish, name: false, price:  15
   expect{menu.add_dish(dish3)}.to raise_error "Invalid data type"
  end
 end
  
 describe "#format" do
  it "returns a formatted string of all dishes" do
   menu = Menu.new
   dish1 = double :Dish, name: "dish1", price:  5
   dish2 = double :Dish, name: "dish2", price:  10
   dish3 = double :Dish, name: "dish3", price:  15
   menu.add_dish(dish1)
   menu.add_dish(dish2)
   menu.add_dish(dish3)
   expect(menu.format).to eq "dish1 : £5\ndish2 : £10\ndish3 : £15"
  end
 end
end