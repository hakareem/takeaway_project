# Takeaway Program Design Recipe

1. Describe the Problem

```
   > As a customer so that I can check if I want to order something
   > I would like to see a list of dishes with prices.

   > As a customer so that I can order the meal I want
   > I would like to be able to select some number of several available dishes.

   > As a customer so that I can verify that my order is correct
   > I would like to see an itemised receipt with a grand total.

   # Using Twilio-Ruby Gem && Using Doubles

   > As a customer so that I am reassured that my order will be delivered on time
   > I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

```

2. Design the Class Interface

---

1. User Story 1 - DISH && MENU
2. User Story 2 - CUSTOMER ORDER
3. User Story 3 - CUSTOMER INFO && ORDER
4. User Story 4 - TWILIO SERVICE

---

```ruby

Dish = Struct.new(:name, :price)
CustomerInfo = Struct.new(:name, :address, :number)

class Order
   def initialize(customer_info,customer_order)
      @customer_info = customer_info
      @customer_order = customer_order
      @sent? = false
   end

   def send
    # sends the order
   end

   def customer
    # returns customer object
   end

   def format
    # returns the order as formatted string
   end
end

class Menu
   def initialize()
      @dishes = []
   end

   def add_dish(dish)
    # adds a dish to the menu
   end

   def remove_dish(dish)
    # removes a dish from the menu
   end

   def format
    # returns the menu as formatted string
   end

   def get_menu
    # returns list of all dishes
   end
end

class CustomerOrder
   def initialize
      @items = []
   end

   def add_item(item)
   # adds an item to the order
   end

   def remove_item(item)
   # removes an item from the order
   end

   def format
      # returns customer's order as formatted string
   end

   def get_items
    # returns all items in order
    end
end

```

3. Create Examples as Integration Tests

```ruby
# EXAMPLE - Integration Testing
menu = Menu.new
dish1 = Dish.new("dish", 10)
dish2 = Dish.new("dish", 10)
dish3 = Dish.new("dish", 10)
menu.add_dish(dish1)
menu.add_dish(dish2)
menu.add_dish(dish3)
menu.get_menu # [dish1, dish2, dish3]

# Removing dishes from menu
menu.remove_dish(dish1)
menu.get_menu # [dish2,dish3]

# Formatting the menu
menu.format # Dish2 : £10, Dish3 : £10

# Removing dish which isn't in the menu
menu.remove(dish5) # Fails

# Customer's Trolley
customer_order = CustomerOrder.new
option1 = Dish.new("dish1", 5)
option2 = Dish.new("dish2", 10)
option3 = Dish.new("dish3", 15)
customer_order.add_item(option1)
customer_order.add_item(option2)
customer_order.add_item(option3)
customer_order.get_items # [option1, option2, option3]

# Removing items from customer order
customer_order.remove_item(option3)
customer_order.get_items # [option1, option2]

# Formatting customer order
customer_order.format # Dish1 : £5 , Dish2 : £10 , Dish3 : £15

# Removing item which isn't in the customers trolley
customer_order.remove_item(option5) # Fails

# Creating an order
customer_order = CustomerOrder.new
option1 = Dish.new("dish1", 5)
option2 = Dish.new("dish2", 10)
option3 = Dish.new("dish3", 15)
customer_order.add_item(option1)
customer_order.add_item(option2)
customer_order.add_item(option3)
customer_info = CustomerInfo.new("Messi", "Paris", "07123456789")
order = Order.new(customer_info,customer_order)
order.send
order.sent? # True

# Formatting the order
order.format # Date: 10/10/2022, Dish1 : £5, Dish2 : £10, Dish3 £15

```

4. Create Examples as Unit Tests

```ruby
# EXAMPLE - Unit Testing

# Class Trolley
customer_order = Trolley.new
option1 = Dish.new("dish1", 5)
option2 = Dish.new("dish2", 10)
option3 = Dish.new("dish3", 15)
customer_order.add_item(option1)
customer_order.add_item(option2)
customer_order.add_item(option3)
customer_order.get_items # [option1, option2, option3]

# Removing items from trolley
customer_order.remove_item(option3)
customer_order.get_items # [option1, option2]

# Class Order
customer_order = CustomerOrder.new
option1 = Dish.new("dish1", 5)
option2 = Dish.new("dish2", 10)
option3 = Dish.new("dish3", 15)
customer_order.add_item(option1)
customer_order.add_item(option2)
customer_order.add_item(option3)
customer_info = CustomerInfo.new("Messi", "Paris", "07123456789")
order = Order.new(customer_info, customer_order)
order.send
order.sent? # True

# Class Menu
menu = Menu.new
dish1 = Dish.new("dish", 10)
dish2 = Dish.new("dish", 10)
dish3 = Dish.new("dish", 10)
menu.add_dish(dish1)
menu.add_dish(dish2)
menu.add_dish(dish3)
menu.get_menu # [dish1, dish2, dish3]

```

5. Implement the Behaviour

```
   Follow the test-driving process of red, green, refactor to implement the behaviour.

```
