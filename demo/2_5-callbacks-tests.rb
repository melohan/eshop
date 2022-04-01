require_relative '../connection'
require_relative '../models'

puts "-----------------------"
puts "Requirement 5"
puts "-----------------------"

clo = Category.create!(name: 'clothes')

product1 = Product.create(name: 'Jeans', price: 100, description: 'Little apple', category: clo)
product2 = Product.create(name: 'Sweat', price: 60, description: 'Big lemon', category: clo)
product3 = Product.create(name: 'Crop top', price: 30, description: 'A limousine', category: clo)

client = Client.create!(firstname: 'Ada', lastname: 'Lovelace')

item1 =   OrderItem.new(quantity: 1, product: product1)
item2 =   OrderItem.new(quantity: 10, product: product2)
item3 =   OrderItem.new(quantity: 5, product: product3)

# Create 4 orders
order1 = client.orders.create(status: 'PROGRESS', order_items: [
  item1,
  item2,
  item3
])

puts order1.to_s
[item1, item2, item3].each{|item| puts item.product.to_s + ' x ' +  item.quantity.to_s}

puts 'Total price: ' + order1.price.to_s

puts "-----------------------"
puts 'Done'
puts "-----------------------"