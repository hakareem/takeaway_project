require "customer_order"
 

RSpec.describe CustomerOrder do
context "adding a dish to an order" do
 it "returns the list of Dishs" do
  customer_info = double :CustomerInfo
  customer_order = CustomerOrder.new
  dish1 = double :Dish, name: "dish1", price:  5
  dish2 = double :Dish, name: "dish2", price:  10
  dish3 = double :Dish, name: "dish3", price:  15
  customer_order.add_item(dish1)
  customer_order.add_item(dish2)
  customer_order.add_item(dish3)
  order = double :Order, customer_info: customer_info, customer_order: customer_order
  allow(order).to receive(:get_items).and_return([dish1, dish2, dish3])
  expect(order.get_items).to eq [dish1, dish2, dish3]
 end
end
 
context "removing dish from an order" do
 it "removes a dish and returns a new list" do
  customer_info = double :CustomerInfo
  customer_order = CustomerOrder.new
  dish1 = double :Dish, name: "dish1", price:  5
  dish2 = double :Dish, name: "dish2", price:  10
  dish3 = double :Dish, name: "dish3", price:  15
  customer_order.add_item(dish1)
  customer_order.add_item(dish2)
  customer_order.add_item(dish3)
  customer_order.remove_item(dish3)
  expect(customer_order.get_items).to eq [dish1, dish2]
 end
end
 
context "adding a dish with invalid data type" do
 it "fails" do
  customer_order = CustomerOrder.new
  dish1 = double :Dish, name: "dish1", price:  "5"
  expect{customer_order.add_item(dish1)}.to raise_error "Invalid data type"
  dish2 = double :Dish, name: nil, price:  10
  expect{customer_order.add_item(dish2)}.to raise_error "Invalid data type"
  dish3 = double :Dish, name: false, price:  15
  expect{customer_order.add_item(dish3)}.to raise_error "Invalid data type"
 end
end
 
describe "#format" do
 it "returns a formatted string of all dishes" do
  customer_info = double :CustomerInfo
  customer_order = CustomerOrder.new
  dish1 = double :Dish, name: "dish1", price:  5
  dish2 = double :Dish, name: "dish2", price:  10
  dish3 = double :Dish, name: "dish3", price:  15
  customer_order.add_item(dish1)
  customer_order.add_item(dish2)
  customer_order.add_item(dish3)
  expect(customer_order.format).to eq "dish1 : £5\ndish2 : £10\ndish3 : £15\nTotal: £30"
 end
end
end
