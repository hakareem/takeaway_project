require "dish"

RSpec.describe Dish do
 context "adding a dish" do
  it "returns name and price" do
   dish = Dish.new("test", 5)
   expect(dish.name).to eq "test"
   expect(dish.price).to eq 5
  end
 end
end