# Resume of commands

## Migration

### Create Model
```shell
rake db:new_migration name=CreateMy_object     options="attribute1:string attribute2:decimal"
```
#### Types

|  Type  |
| ------ |
|t.string :attribute, limit: n|
|t.datetime :attribute|
|t.decimal :attribute, precision n, scale: m|
|t.integer :attribute|
|t.references :otherObject, foreign_key: true, type: :bigint|

## Relations

### 1-N

Table `categories` has multiple `products`:

Add `references` in table `products`
```ruby
class CreateProduct < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true, type: :bigint
    end
  end
end
```
In `category model`  add
```ruby
class Category < ActiveRecord::Base  
    has_many :products
end
```
In `product model`  add
```ruby
class Product < ActiveRecord::Base  
    belongs_to :category
end
```

###  N - N indirecte 
`order` is composed of *several* `order_items` which `each reference a product`.
```ruby
class Order < ActiveRecord::Base
    belongs_to :client
    has_many :order_items
    has_many :products, through: :order_items
end
  
class Product < ActiveRecord::Base
    belongs_to :category
    has_many :order_items
    has_many :orders, through: :order_items
end

class OrderItem < ActiveRecord::Base
    belongs_to :order
    belongs_to :product
end
```

## ActiveRecord

You have to add this in the begining of each files that uses AR objects
```ruby
require_relative 'connection'
require_relative 'models'
```
> Be careful it's the path from root inside a folder you need to add `../`

### Create

Simple creation
```ruby
fru = Category.create(name: 'fruits')
```
Create with attributes (from array)
```ruby 
an_order.order_items << [
  OrderItem.new(quantity: 3, product: product3),
  OrderItem.new(quantity: 200, product: product4)
]
an_order.save
```

### Validations

Syntax example:
```ruby
#to add in models
validates :product, :order, presence: true
validates :quantity, numericality: {greater_than_or_equal_to: 1, only_integer: true}
```
### Valid?
Before saving an Active Record object Rails return your validation.

To trigger yourself your validation you can simply use `.valid?` or `.invalid?`
```ruby
Client.create(firstname: "John", lastname: "Doe").valid?    # => true
Client.create(firstname: nil, lastname: nil).invalid?       # => true
```

#### Validate_associated
In the case where an associations need other models to be validated.
```ruby
class Library < ApplicationRecord
  has_many :books
  validates_associated :books
end
```

#### possibilities

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

## Methods

## each
Demo with display
```ruby
Product.cheap.first(3).each{|p| puts p.to_s }   
```
