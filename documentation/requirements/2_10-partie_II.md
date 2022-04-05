# Exercise 2 - Requirement part II

## Description

1. Show the most expensive order
2. Show categories that have never been ordered
3. Delete customers who have not placed any orders
4. Determine if there are orders or not between two given dates

## Resolution

### 1. Show the most expensive order
1. In `client.rb`
```ruby
orders = Order.most_expensive
```
2. In `order.rb`
```ruby
def total
    order_items.sum(&:item_price)
    order_items.sum(&:price)
end


  def self.most_expensive
    select('orders.*, SUM(order_items.quantity * products.price) as total_price')
      .joins(:order_items)
      .joins(:products)
      .group('orders.id')
      .order('total_price DESC')
      .first
  end

```

### 2. Show categories that have never been ordered

1. In `category.rb`
```ruby
scope :not_ordered, -> { where.not(id: joins(:orders).pluck(:id)) }
```

### 3. Delete customers who have not placed any orders
1. In `client.rb`
```ruby
scope :never_ordered_products, -> { where.missing(:ordered_products) }
```



### 4. Determine if there are orders or not between two given dates
1. In `order.rb`
```ruby
scope :between, ->(date1, date2) { where(["shipped_at >= ? AND shipped_at <= ?", date1, date2]) }
```