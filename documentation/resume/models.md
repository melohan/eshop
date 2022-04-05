## Models

## Index

1. [1-N relation](#1-n-relation)
2. [N-N indirect](#n---n-indirecte)
3. [Polymorphic Association](#polymorphic-association)


## 1-N Relation


Table `A` has multiple `B` means
- `A` migration file should contains `t.references :b, foreign_key: true, type: :bigint`

- A should specify `has_many :b`
- B should specify ` belongs_to :a`

### Example

> Table `categories` has multiple `products`


![](pictures/1-n.png)


`Category` migration file should contain `t.references :category, foreign_key: true, type: :bigint`

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

## N - N indirecte 

`order` is composed of *several* `order_items` which `each reference a product`.

![](pictures/n-n-indirect.png)

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

## Polymorphic association

You have to add column that defines your association for example `individual` and `company` are `type` of clients

1. Add in your migration file:
```ruby
class AddTypeToClient < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :type, :string, :after => :id
  end
end
```

2. Then you have to create a model for each types and extends it from your parent model.
`company.rb`
```ruby
class Company < Client
end
```
You can add other colomn in a migration file with a special name such as `rake db:new_migration name=inherit_company_from_client` but it won't' do anything special.

3. You can also specify in the inherited class that some attributes are required: 

`individual.rb`
```ruby
class Individual < Client
  validates :firstname, :lastname, presence: true, length: { minimum: 3 }
end
```