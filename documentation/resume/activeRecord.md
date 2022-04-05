# Active Records

## Index

1. [Validations](#validations)
2. [Valid?](#valid)
    - [Possibilities](#possibilities)
3. [Callbacks](#callbacks)
4. [Observers](#observers)

> You can see `each` and `sum` methods [here](#methods).

## Validations

Syntax example:
```ruby
#to add in models
validates :product, :order, presence: true
validates :quantity, numericality: {greater_than_or_equal_to: 1, only_integer: true}
```
## Valid?
Before saving an Active Record object Rails return your validation.

To trigger yourself your validation you can simply use `.valid?` or `.invalid?`
```ruby
Client.create(firstname: "John", lastname: "Doe").valid?    # => true
Client.create(firstname: nil, lastname: nil).invalid?       # => true
```

## Validate_associated
In the case where an associations need other models to be validated.
```ruby
class Library < ApplicationRecord
  has_many :books
  validates_associated :books
end
```

### Possibilities

|  Type  |  Description  |
| ------ |------|
|`validates :start_date, comparison: { greater_than: :end_date }`| will validate a comparison between any two comparable values. \* can be used with `:greater_than_or_equal_to`, `:equal_to`, `:less_than`, `:other_than` |
|`validates :subdomain, exclusion: { in: %w(www us ca jp)}`| validates that the attributes' values are not included in a given set. |
|`validates :legacy_code, format: { with: /\A[a-zA-Z]+\z/}`| validates the attributes' values by testing whether they match a given regular expression, which is specified using the :with option. |
|`validates :size, inclusion: { in: %w(small medium large)}`| validates that the attributes' values are included in a given set |
|`validates :name, length: { minimum: 2}`|validates the length of the attributes' values|
|`validates :points, numericality: true`|validates that your attributes have only numeric values|
|`validates :points,uniqueness: true`|Field must be unique in db|

Exemple avec validates unless
```ruby
class Car < ActiveRecord::Base
    validates :color, length: {minimum: 3},
    unless: ->(car) { car.engine.nil? }
end
```

## Callbacks

Example 
```ruby
before_create { self.item_price = self.product.price }
```

The callbacks are executed in this order according to the three scenarios

    At the creation:      TO update:            To destruction:

    before_validation     before_validation     before_destroy
    after_validation      after_validation      around_destroy
    before_save           before_save           after_destroy
    around_save           around_save
    before_create         before_update
    around_create         around_update
    after_create          after_update
    after_save            after_save
 

## Observers

You'll need:
```
require 'rails/observers/activerecord/active_record'
```

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

In your main file you have to add this to make it works:
```ruby 
ActiveRecord::Base.observers << :product_observer
ActiveRecord::Base.instantiate_observers

```

# Methods

## each
Demo with display
```ruby
Product.cheap.first(3).each{|p| puts p.to_s }   
```

## Sum
```ruby
order_items.sum(&:price)
```