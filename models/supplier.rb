class Supplier < ActiveRecord::Base

    has_many :products
    has_many :categories, -> { distinct }, through: :products

    def to_s
        "#{name} #{phoneNumber}"
    end


end