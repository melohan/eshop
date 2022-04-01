# Exercise 2 - Requirement 4

## Description

The consistency of data in the database is important, so you will add validation rules: 
- A customer must have a first name and a last name (not too short)
- An order can only be placed if: there is at least one product ordered 

## Resolution

1. Add in `client` model
```ruby
validates :lastname, presence: true, length: { minimum: 2, maximum: 60 }
```

2. Add in `order_item` model
```ruby
validates :product, :order, presence: true
validates :quantity, numericality: {greater_than_or_equal_to: 1, only_integer: true}
```

3. Add in `product` model
```ruby
validates :category, presence: true
validates :name, length: {minimum: 2, maximum: 50}
validates :price, numericality: {greater_than: 0}
```