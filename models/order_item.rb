class OrderItem < ActiveRecord::Base
    
    belongs_to :order
    belongs_to :product

    scope :bulk, ->(quantity = 100) { where('quantity >= ?', quantity) }
    
    validates :product, :order, presence: true
    validates :quantity, numericality: {greater_than_or_equal_to: 1, only_integer: true}

    def to_s
        "N°#{id} : #{quantity}, #{self.product} CHF."
    end

end