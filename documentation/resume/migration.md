# Migration

## Index

1. [Types](#types)
2. [Create table](#create-table)
3. [Add column](#add-column)
4. [Add references](#add-references)
    
## Types
> Here is the differents types you can specify in `options` or in migration file.

|  Type  |
| ------ |
|t.string :attribute, limit: n|
|t.datetime :attribute|
|t.decimal :attribute, precision n, scale: m|
|t.integer :attribute|
|t.references :otherObject, foreign_key: true, type: :bigint|


## Create table
> `name` should start by Create
```shell
rake db:new_migration name=CreateProduct options="attribute1:string attribute2:decimal"
```

## Add column

> `name` should be by Add...ToTable

```shell
rake db:new_migration name=AddExampleToProduct options="example:string"
```

It would directly create your migration with if you precise `options` this content: ` add_column :products, :example, :string`
You can specify `:after :otherAttribute` to fix position of the new column in table.

And if you need to specify or edit a type, edit migration file
```ruby
  def change
    change_table :clients do |t|
      t.string :brand, limit: 120
    end
  end
```

## Add references
> `name` should be defined as follow "Add[TableA]to[TableB]" and you have to specify in `options` "[TableA]:references"
```ruby
rake db:new_migration name=AddExampleToProduct options="Example:references" 

You can specify `constraint` by editing this migration file as follow:
```ruby
foreign_key: { on_delete: :nullify, on_update: :cascade }
```