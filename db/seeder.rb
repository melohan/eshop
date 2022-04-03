require_relative '../connection'
require_relative '../models'


fru = Category.create(name: 'fruits')
ran = Category.create(name: 'random')
veg = Category.create(name: 'vegetables')
clo = Category.create!(name: 'clothes')

product1 = Product.create(name: 'apple', price: 2.35, description: 'Little apple', category: fru)
product2 = Product.create(name: 'lemon', price: 6.15, description: 'Big lemon', category: fru)
product3 = Product.create(name: 'potato', price: 25.95, description: 'A limousine', category: veg)
product4 = Product.create(name: 'Jeans', price: 100, description: 'Little apple', category: clo)
product5 = Product.create(name: 'Sweat', price: 60, description: 'Big lemon', category: clo)
product6 = Product.create(name: 'Crop top', price: 30, description: 'A limousine', category: clo)


client1 = Client.create(firstname: 'Rachel', lastname: 'Green')
client2 = Client.create(firstname: 'Karen', lastname: 'Smith')
client3 = Client.create(firstname: 'Ada', lastname: 'Noether')

order1 = client1.orders.create(status: 'PROGRESS', order_items: [
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


item1 =   OrderItem.new(quantity: 1, product: product1)
item2 =   OrderItem.new(quantity: 10, product: product2)
item3 =   OrderItem.new(quantity: 5, product: product3)

# Create 4 orders
order1 = client3.orders.create(status: 'PROGRESS', order_items: [
  item1,
  item2,
  item3
])


Supplier.create(
  [
    { name: 'migros' },
    { name: 'denner', phoneNumber: '+41 21 222 33 11' },
    { name: 'manor' },
  ]
)

Supplier.first.products  << [Product.first]
Supplier.second.products << [Product.second, Product.third]
Supplier.third.products  << [Product.second]

puts '------ Done ------'