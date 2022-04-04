require_relative 'init'

puts "-----------------------"
puts "Requirement 7"
puts "-----------------------"


puts Client.first.to_s + " said: "


Client.first.comments << [
  Comment.new(body: 'This is bad !', target: Product.first),
  Comment.new(body: 'Oh this one is ok!', target: Supplier.first),
  Comment.new(body: 'Why not.', target: Supplier.second),
]

Client.first.comments.each{|comment| puts comment.to_s + ' about ' + comment.target.to_s}

puts "-----------------------"
puts 'Done'
puts "-----------------------"