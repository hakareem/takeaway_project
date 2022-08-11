require "order"


RSpec.describe Order do
 context "submitting an order" do
  it "should returns true when submitted" do
   customerInfo = double :CustomerInfo
   customerOrder = double :CustomerOrder
   order = Order.new(customerInfo, customerOrder)
   expect(order.submit).to eq true
  end
 end

 context "after submitting the order" do
  it "returns a customer object" do
   customerInfo = double :CustomerInfo, name: "Messi", address: "Paris", number: "07123456789"
   customerOrder = double :CustomerOrder
   order = Order.new(customerInfo, customerOrder)
   expect(order.customer).to eq customerInfo
  end
 end
end