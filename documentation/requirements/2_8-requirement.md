# Exercise 2 - Requirement 8

## Description

The system is becoming social, so our users want to be able to post comments on: 
- Products
- Suppliers 
Add tables, templates and associations. 

## Resolution

Use of polymorphic association. This is the table that will have the id of the subject and a type field to specify whose id it has.

1. We'll simply create our migration file and update it with references:

```shell
rake db:new_migration name=CreateComment options="body:string"
```
2. In this file add
```ruby
class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.references :author, foreign_key: { to_table: :clients, on_delete: :nullify, on_update: :cascade }
      t.references :target, polymorphic: true
      t.timestamps
    end
  end
end
```

> The author would be the client with `t.references :author`
> The polymorphic association would be defined by `t.references :target, polymorphic: true`

3. Migrate it with  
```shell
rake db:drop db:create db:migrate
```

4. Then create his model:

```shell
touch models/comment.rb
```

5. Add in `models/comment.rb` 
```ruby
class Comment < ActiveRecord::Base
  belongs_to :target, polymorphic: true
  belongs_to :author, class_name: 'Client'
end
```

6. Add in `models/client.rb`
```ruby
has_many :comments, foreign_key: :author_id
```

7. Add in `models/product.rb`
```ruby
has_many :comments, as: :target
```

8. Add in `models/supplier.rb`
```ruby
has_many :comments, as: :target
```