class Product < ApplicationRecord
    belongs_to :supplier
    has_many :carted_products
    has_many :orders, through: :carted_products
    has_many :images
    has_many :category_products
    has_many :categories, through: :category_products

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

    # def categories
    #     category_proudcts.map do |category_product|
    #         category_product.category
    #     end
    # end

end
