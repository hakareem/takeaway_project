require 'dotenv/load'
require "customer_info"
require "customer_order"
require "dish"
require "menu"
require "order"
require "twilio_service"

RSpec.describe "integration" do
  context "adding items to the menu" do
  it "returns all items added" do 
    menu = Menu.new
    dish1 = Dish.new("dish", 5)
    dish2 = Dish.new("dish", 10)
    dish3 = Dish.new("dish", 15)
    menu.add_dish(dish1)
    menu.add_dish(dish2)
    menu.add_dish(dish3)
    expect(menu.get_menu).to eq [dish1, dish2, dish3]
  end
  end

  describe "#format" do
  it "formats all the dishes" do
    menu = Menu.new
    dish1 = Dish.new("dish", 5)
    dish2 = Dish.new("dish", 10)
    dish3 = Dish.new("dish", 15)
    menu.add_dish(dish1)
    menu.add_dish(dish2)
    menu.add_dish(dish3)
    expect(menu.format).to eq "dish : £5\ndish : £10\ndish : £15"
  end
  end

  context 'Creating an order' do
    it 'should format the order' do
      customer_info = CustomerInfo.new('Messi', 'Paris', '+447777111222')
      customer_order = CustomerOrder.new
      dish1 = Dish.new('Dish 1', 10)
      dish2 = Dish.new('Dish 2', 20)
      dish3 = Dish.new('Dish 3', 30)
      customer_order.add_item(dish1)
      customer_order.add_item(dish2)
      customer_order.add_item(dish3)
      order = Order.new(customer_info, customer_order)
      order.submit
      expect(order.format).to eq "Customer: Messi\nAddress: Paris\nNumber: +447777111222\nDish 1 : £10\nDish 2 : £20\nDish 3 : £30\nTotal: £60"
    end
  end

  context 'When sending an SMS' do
    xit 'receive a message to update you on delivery time' do
      dish1 = Dish.new('Dish 1', 10)
      dish2 = Dish.new('Dish 2', 20)
      dish3 = Dish.new('Dish 3', 30)
      customer_order.add_item(dish1)
      customer_order.add_item(dish2)
      customer_order.add_item(dish3)
      customer_info = CustomerInfo.new('Messi', 'Paris', '+447777111222')
      order = Order.new(customer_info, customer_order)
      order.submit
      twilio = TwilioService.new
      expect(twilio.send_text(ENV["MESSAGE"], ENV["TO_NUMBER"])).to eq "queued"
    end
  end
end