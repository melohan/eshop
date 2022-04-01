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
    has_many :order_items
    has_many :products, through: :order_items
end

class Product < ActiveRecord::Base
    has_many :orders, through: :order_items
    has_many :order_items
    belongs_to :category
end

class OrderItem < ActiveRecord::Base
    belongs_to :order
    belongs_to :product, foreign_key: 'item_id'
end
```