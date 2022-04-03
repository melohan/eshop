# Exercise 2 - Requirement 7

## Description

Our platform is evolving towards a B2B exchange system, so we have to add the notion of Supplier. 
Each product is linked to a supplier. It will be possible to list the categories covered by each supplier. 

## Resolution

1. Create migration file
```shell
rake db:new_migration name=CreateSupplier options="name:string phoneNumber:string"
```

2. Create model file
```shell
touch models/supplier.rb
```

3. Add this following content:
```ruby
class Supplier < ActiveRecord::Base
  has_many :products
  has_many :categories, -> { distinct }, through: :products
  has_many :comments, as: :target
end
```
> We need to display unique records from a has_many, through relationship. The way to do it is to use `distinct`


4. Next, we need to add this supplier reference in `categories`
```ruby
rake db:new_migration name=AddSupplierForeignKeyToProduct options="supplier:references"
```

We'll update a bit this migration file, replace `true` by `{ on_delete: :nullify, on_update: :cascade }` on foreign key

```ruby
class AddSupplierToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :supplier, foreign_key: { on_delete: :nullify, on_update: :cascade }
  end
end
```

5. Add to_s method to test
```ruby
    def to_s
        "#{name} #{phone_number}"
    end
```
