class Order
   attr_reader :submitted
   
   def initialize(customer_info, customer_order)
      @customer_info = customer_info
      @customer_order = customer_order
      @submitted = false
   end

   def submit
      @submitted = true
   end

   def customer
      @customer_info
   end

   def format
      output = "Customer: #{@customer_info.name}\nAddress: #{@customer_info.address}\nNumber: #{@customer_info.number}\n"
      output += @customer_order.get_items.map {|item| "#{item.name} : £#{item.price}"}.join("\n")
      output += "\nTotal: £#{@customer_order.get_items.sum{|item| item.price}}"
   end

end