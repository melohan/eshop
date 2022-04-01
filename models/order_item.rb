class OrderItem < ActiveRecord::Base
    belongs_to :order
    belongs_to :product

    scope :bulk, ->(quantity = 100) { where('quantity >= ?', quantity) }

    def to_s
        "N°#{id} : #{quantity}, #{self.product} CHF."
    end
    
end