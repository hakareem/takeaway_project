$LOAD_PATH << "lib"
require "customer_info"
require "customer_order"
require "dish"
require "menu"
require "order"
require "twilio_service"
require "interface"


class TerminalIO
 def gets
  return Kernel.gets
 end

 def puts(message)
  Kernel.puts(message)
 end
end


io = TerminalIO.new
customer_info = CustomerInfo.new('Messi', 'Paris', '+447777111222')
customer_order = CustomerOrder.new
dish1 = Dish.new('Dish 1', 10)
dish2 = Dish.new('Dish 2', 20)
dish3 = Dish.new('Dish 3', 30)
customer_order.add_item(dish1)
customer_order.add_item(dish2)
customer_order.add_item(dish3)
order = Order.new(customer_info, customer_order)
interface = Interface.new(io,order)
interface.run