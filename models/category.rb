class Category < ActiveRecord::Base  
    has_many :products
    has_many :orders, -> { distinct }, through: :products
end