require_relative 'init'

puts "-----------------------"
puts "Requirement 3"
puts "-----------------------"

puts 'Get cheap first'
puts '----------'
puts Product.cheap.first.to_s   
puts '----------'
puts 'Get cheap 3 first'
Product.cheap.first(3).each{|p| puts p.to_s }   
puts '----------'
puts 'Get bulk first'
puts OrderItem.bulk.first.to_s   
puts '----------'
puts 'Get bulk 3 first'
OrderItem.bulk.first(3).each{|o| puts o.to_s }   

puts "-----------------------"
puts 'Done'
puts "-----------------------"