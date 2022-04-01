require_relative '../connection'
require_relative '../models'

puts "-----------------------"
puts "Requirement 5"
puts "-----------------------"

client      = Client.create!(firstname: 'Fran', lastname: 'Fine')
individual  = Individual.create(firstname: 'Maxwell', lastname:'Sheffield')
company     = Company.create(brand:'Nike')

puts client.to_s
puts individual.to_s
puts company.to_s

puts "-----------------------"
puts 'Done'
puts "-----------------------"