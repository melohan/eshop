# Exercise 2 - Requirement 5

## Description

When ordering, the goal is to display the total price of the order. 
Add the necessary code to obtain this total price. 
Make sure that the product price is copied in item_price of OrderItem to have the product price when ordering. 
The goal is to add the code for these features in the right places! 

## Resolution

1. In `order_item` model add this directive to make sure that the product price is copied in `item_price` before the creation/insertion in db
```ruby
before_create { self.item_price = self.product.price }
```

2. Add in `order_item` model
```ruby
def price
    self.item_price * self.quantity
end
```

3. Add in `Order` model add this function that will call `Order_item.price` method
```ruby
def price
    order_items.sum(&:price)
end
```


4. Add this in `order` to test
```ruby
def to_s
    "La commande #{id} du #{created_at}"
end
```