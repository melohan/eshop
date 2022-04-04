# Exercise 2 - Requirement 9

## Description

sThe system sends an email when the number of pieces of each product in stock falls below 5 pieces

## Resolution

1. Add to your `Gemfile` : `gem "rails-observers", "~> 0.1.5"`

2. We'll add and attribute `level_of_stock` to our products with this command:
```shell
rake db:new_migration name=add_level_of_stock_to_products  options="levelOfStock:integer"
```
It should create `x_add_level_of_stock_to_product` with
```ruby
class AddLevelOfStockToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :level_of_stock, :integer
  end
end
```
3. In model create the observer `touch models/product_observer.rb`

4. Add in this file
```ruby
class ProductObserver < ActiveRecord::Observer
  observe :product

  def before_save(model)
      if model.level_of_stock < 5
          puts "Product #{model.name}'s quantity is bellow 5"
      end
  end
end
```

5. In `main` add this before your test
```ruby
require_relative 'init'

require_relative 'connection'
require 'rails/observers/activerecord/active_record'


ActiveRecord::Base.observers << :product_observer
ActiveRecord::Base.instantiate_observers
```