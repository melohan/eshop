require_relative 'init'

puts "-----------------------"
puts "Requirement 4"
puts "-----------------------"

client1 = Client.create!(firstname: 'Lily-Jane', lastname: 'DoeDoe')

order = Order.new(client: client1)
puts 'Order.new(client: client1)'
puts 'order.save return ' +  order.save.to_s
# => false

puts ' '

order.order_items.build
puts 'order.order_items.build'
puts 'order.save return ' +  order.save.to_s
# => false

puts ' '

order.order_items.build(quantity: 10)
puts 'order.order_items.build'
puts 'order.save return ' +  order.save.to_s
# => false

puts ' '

order.order_items.build(product: Product.first)
puts 'order.order_items.build'
puts 'order.save return ' +  order.save.to_s
# => false


puts "-----------------------"
puts 'Done'
puts "-----------------------"