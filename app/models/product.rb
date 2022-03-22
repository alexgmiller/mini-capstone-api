class Product < ApplicationRecord
    belongs_to :supplier
    has_many :orders
    has_many :images

    def is_discounted
        price < 10
    end

    def tax
        tax = price * 0.09
        tax.round(3)
    end

    def total
        tax + price
    end

end
