require_relative 'init'

require_relative 'connection'
require 'rails/observers/activerecord/active_record'


ActiveRecord::Base.observers << :product_observer
ActiveRecord::Base.instantiate_observers

example = Product.first
puts example.level_of_stock
example.level_of_stock = 1
example.save!
