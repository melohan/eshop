class Product < ActiveRecord::Base
    
    belongs_to :category
    has_many :order_items
    has_many :orders, through: :order_items

    scope :cheap, -> { where('price <= 0.20') }

    validates :category, presence: true
    validates :name, length: {minimum: 2, maximum: 50}
    validates :price, numericality: {greater_than: 0}

    def to_s
        "N°#{id} : #{name}, #{price}CHF"
    end

end