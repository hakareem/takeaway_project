require "customer_info"

RSpec.describe CustomerInfo do
 context "constructs" do
  it "returns name, address and number of the customer" do
   customer = CustomerInfo.new("Messi", "Paris", "07123456789")
   expect(customer.name).to eq "Messi"
   expect(customer.address).to eq "Paris"
   expect(customer.number).to eq "07123456789"
  end
 end
end