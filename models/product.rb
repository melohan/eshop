class Product < ActiveRecord::Base
    has_many :orders, through: :order_items
    has_many :order_items
    belongs_to :category
end