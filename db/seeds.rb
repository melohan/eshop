puts 'Start to seed...'

# Create categories
fru = Category.create(name: 'fruits')
ran = Category.create(name: 'random')
veg = Category.create(name: 'vegetables')
clo = Category.create!(name: 'clothes')

# Create products
product1 = Product.create(name: 'apple', level_of_stock:400, price: 2.35, description: 'Little apple', category: fru)
product2 = Product.create(name: 'lemon', level_of_stock:400, price: 6.15, description: 'Big lemon', category: fru)
product3 = Product.create(name: 'potato', level_of_stock:400, price: 25.95, description: 'A limousine', category: veg)
product4 = Product.create(name: 'Jeans', level_of_stock:400, price: 100, description: 'Little apple', category: clo)
product5 = Product.create(name: 'Sweat', level_of_stock:400, price: 60, description: 'Big lemon', category: clo)
product6 = Product.create(name: 'Crop top', level_of_stock:400, price: 30, description: 'A limousine', category: clo)

# Create clients
client1 = Client.create(firstname: 'Rachel', lastname: 'Green')
client2 = Client.create(firstname: 'Karen', lastname: 'Smith')
client3 = Client.create(firstname: 'Ada', lastname: 'Noether')

order1 = client1.orders.create(status: 'PROGRESS', order_items: [
  OrderItem.new(quantity: 2, product: product1),
  OrderItem.new(quantity: 125, product: product3)
])

# Create orders
order1 = Order.new(status: 'PROGRESS')
order1.order_items << [
  OrderItem.new(quantity: 3, product: product3),
  OrderItem.new(quantity: 200, product: product4)
]

order2 = Order.new(status: 'PROGRESS')
order2.order_items << [
  OrderItem.new(quantity: 1, product: product1),
  OrderItem.new(quantity: 75, product: product2),
  OrderItem.new(quantity: 200, product: product4)
]

order3 = Order.new(status: 'PROGRESS')
order3.order_items << [
  OrderItem.new(quantity: 1, product: product1)
]

order1 = Order.new(status: 'PROGRESS')
order1.order_items << [
  OrderItem.new(quantity: 200, product: product4)
]

# Create suppliers
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

# Create comments
Client.first.comments << [
  Comment.new(body: 'This is bad !', target: Product.first),
  Comment.new(body: 'Oh this one is ok!', target: Supplier.first),
  Comment.new(body: 'Why not.', target: Supplier.second),
]


puts '------------'
puts 'Done'