class CustomerOrder
  def initialize
     @items = []
  end
 
  def add_item(item)
     fail "Invalid data type" unless item.name.is_a?(String) && item.price.is_a?(Integer)
     @items << item
  end
 
  def remove_item(item)
     @items.delete_at(@items.index(item))
  end
 
  def format
     output = @items.map {|item| "#{item.name} : £#{item.price}"}.join("\n")
     output += "\nTotal: £#{@items.sum{|item| item.price}}"
     p output
  end
 
  def get_items
     @items
  end
end
