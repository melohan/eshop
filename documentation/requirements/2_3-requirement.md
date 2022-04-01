# Exercise 2 - Requirement 3

## Description

Add the following scopes: 
1. On Product: cheap which allows to output products with a price of -.20 or less
2. On OrderItem: bulk which will output items that have been ordered with a quantity of 100 pieces or more. This scope will accept a parameter which is the threshold for the number of pieces. As shown by default it is 100 pieces. 

## Resolution

1. Add in product model
```ruby
scope :cheap, -> { where('price <= 0.20') }
```

2. Add in order_item model
```ruby
scope :bulk, ->(quantity = 100) { where('quantity >= ?', quantity) }
```

3. Add this following code to test the scope in `product`
```ruby
  def to_s
    "N°#{id} : #{name}, #{price}CHF"
  end
```

5. Display

```ruby
# Display one
Product.cheap.first.to_s
# Display many
puts Product.cheap.first(3).each{|p| puts p.to_s }   
```



## Theory

This is an example of scopes, in fact these two are equivalent, just the syntax changes
```ruby
class Car < ActiveRecord::Base
    
    scope :white, -> { where(color: 'white') }
    
    def self.white
        where(color: 'white')
    end

end
```