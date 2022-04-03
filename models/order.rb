class Order < ActiveRecord::Base

    belongs_to :client
    has_many :order_items
    has_many :products, through: :order_items

    validates :order_items, :client, presence: true
    validates_associated :order_items
    
    def price
        order_items.sum(&:price)
    end
    
    def to_s
        "La commande #{id} du #{created_at}"
    end

end
  