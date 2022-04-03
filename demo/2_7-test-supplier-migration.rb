require_relative '../connection'
require_relative '../models'

puts "-----------------------"
puts "Requirement 7"
puts "-----------------------"


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

suppliers = [Supplier.first, Supplier.second, Supplier.third]

suppliers.each{|s| puts s.to_s + "(" + s.categories.count.to_s + " covered products categories)"}

puts "-----------------------"
puts 'Done'
puts "-----------------------"