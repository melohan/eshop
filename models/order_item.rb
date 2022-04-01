class OrderItem < ActiveRecord::Base
    
    belongs_to :order
    belongs_to :product

    scope :bulk, ->(quantity = 100) { where('quantity >= ?', quantity) }
    
    validates :product, :order, presence: true
    validates :quantity, numericality: {greater_than_or_equal_to: 1, only_integer: true}

    before_create { self.item_price = self.product.price }

    def price
        self.item_price * self.quantity
    end

    def to_s
        "N°#{id} : #{quantity}, #{self.product} CHF."
    end

end