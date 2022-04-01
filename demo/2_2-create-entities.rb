require_relative '../connection'
require_relative '../models'

puts "-----------------------"
puts "Requirement 2"

# Create 3 categories
fru = Category.create(name: 'fruits')
ran = Category.create(name: 'random')
veg = Category.create(name: 'vegetables')

# Create 6 products each associated to 1 category
product1 = Product.create(name: 'apple', price: 2.35, description: 'Little apple', category: fru)
product2 = Product.create(name: 'lemon', price: 6.15, description: 'Big lemon', category: fru)
product3 = Product.create(name: 'potato', price: 25.95, description: 'A limousine', category: veg)
product4 = Product.create(name: 'lettuce', price: 5.10, description: 'A fruit', category: veg)
product5 = Product.create(name: 'letter A', price: 0.20, description: 'Letter printed on A4 paper', category: ran)
product6 = Product.create(name: 'letter AB', price: 0.20, description: 'Letter printed on A4 paper', category: ran)

# Create 3 clients
client = Client.create(firstname: 'Rachel', lastname: 'Green')
Client.create(firstname: 'Karen', lastname: 'Smith')
Client.create(firstname: 'Ada', lastname: 'Noether')

# Create 4 orders
order1 = client.orders.create(status: 'PROGRESS', order_items: [
  OrderItem.new(quantity: 2, product: product1),
  OrderItem.new(quantity: 125, product: product3)
])

order2 = Order.new(status: 'PROGRESS')
order2.order_items << [
  OrderItem.new(quantity: 3, product: product3),
  OrderItem.new(quantity: 200, product: product4)
]

order3 = Order.new(status: 'PROGRESS')
order3.order_items << [
  OrderItem.new(quantity: 1, product: product1),
  OrderItem.new(quantity: 75, product: product2),
  OrderItem.new(quantity: 200, product: product4)
]

order4 = Order.new(status: 'PROGRESS')
order4.order_items << [
  OrderItem.new(quantity: 1, product: product1)
]

order2 = Order.new(status: 'PROGRESS')
order2.order_items << [
  OrderItem.new(quantity: 200, product: product4)
]

order2.save!

client.orders << order2

client.save!

puts 'Done'
puts "-----------------------"