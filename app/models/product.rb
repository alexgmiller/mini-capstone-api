class Product < ApplicationRecord
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
